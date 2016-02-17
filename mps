#!/bin/bash
versiyon="0.1"
paketdepo="/depo/paketler/"
sunucu="192.168.3.193:8000/paketdepo/"
ikaynak=""
betikad=${0##*/}
kurulum_onay="evet"
dokunulmaz="/etc/dokunulmaz"

icerik_ekle(){
	paketad=`echo "$1" | cut -d'#' -f1`	
	paketad=`basename $paketad`
	echo $paketad" paketi kuruluyor."
	mkdir -p /var/lib/pkg/DB/"$paketad" &&
	tar xf $1 -C /  && 
	mv /.MTREE /var/lib/pkg/DB/"$paketad"/files &&
	mv /.META /var/lib/pkg/DB/"$paketad"/META &&
	ldconfig &&
	echo $paketad" paketi kuruldu."
}

paket_sil(){
	local paket kkont
	if [ -f $dokunulmaz ];then
		kkont=`kurulu_kontrol "$1"`
		if [ "$kkont" = "kurulu" ];then
			paket="$1"
			
			echo $paket" paketi siliniyor."
			#while IFS='' read -r line || [[ -n "$line" ]]; do
			while read -r dosya
			do
				if [[ $(grep -c $dosya $dokunulmaz) -eq 0 ]]; then
					#echo /$dosya
					rm -r -f /$dosya
				fi
			done < /var/lib/pkg/DB/"$paket"/files
			rm -r -f /var/lib/pkg/DB/"$paket" &&
			echo $paket" paketi silindi."
		else
			echo "paket zaten kurulu değil!"
		fi
	else
		echo "kritik mesaj:$dokunulmaz dosyası yok."
		#tamirat
		cp /root/ayarlar/dokunulmaz /etc/
		echo "dokunulmazlık tamiri yapıldı.,komutu yineleyiniz."
	fi

}

paket_bilgi(){
	local paket kkont
	kkont=`kurulu_kontrol "$1"`
	if [ "$kkont" = "kurulu" ];then
		paket="$1"
		cat /var/lib/pkg/DB/"$paket"/META
	else
		echo "paket kurulu değil!"
	fi

}

kurulu_kontrol(){
	if [ -d "/var/lib/pkg/DB/$1" ];then
		echo "kurulu"
		exit 1
	fi
	echo "degil"
}

paketvt_guncelle(){
	wget -q --spider "$sunucu""paket.vt"
	#if wget -P /tmp -q "$sunucu""paket.vt" > /dev/null; then
	if [ $? -eq 0 ]; then	
		echo "paket veritabanı guncellenıyor." "$paketdepo""paket.vt"
		if [ -f "$paketdepo""paket.vt" ];then
			mv "$paketdepo""paket.vt" "$paketdepo""paket.vt.eski"
		fi
		wget -P "$paketdepo" "$sunucu""paket.vt"
		#rm /tmp/paket.vt*
		exit 1
	fi
	echo "paket veritabanı guncelleme olumsuz."
}

sistem_kontrol(){
	paketvt_kontrol
	sunucu_kontrol
}

sunucu_kontrol(){
	wget -q --spider $sunucu
	if [ $? -eq 0 ]; then
		echo "paket sunucu aktif"
	else
		echo "sunucu erişim dışı"
		exit 1
	fi
}	

paketvt_kontrol(){
	mkdir -p /depo/paketler
	if [ ! -f /depo/paketler/paket.vt ];then
		touch /depo/paketler/paket.vt
	fi
}

yardim(){
 echo "ağdan kurulum"		
 echo "paketkur -ak nano "
 echo ""
 echo "yerelden kurulum"
 echo "paketkur -yk /a/b/nano.mps.xz "
}


ayarlar() {
	
	while [ "$1" ]; do
		case $1 in
			-i|--indir)
				ikaynak="ag" 
				kurulum_onay="olumsuz";;
			-ik|--inku)
				ikaynak="ag" ;;
			-k|--yrku)
				ikaynak="yerel" ;;
			-s|--pksl)
				paket_sil "$2" ;;
			-b|--pkbl)
				paket_bilgi "$2" ;;
			-G|--pvtg)
				paketvt_guncelle ;;
			-g|--pkgu)
				if [ ! "$2" ]; then
					echo "paket ismi eksik"
					exit 1
				fi
				paket_guncelle "$2";;
			-kuko|--kurulu-kontrol)
				if [ ! "$2" ]; then
					echo "paket ismi eksik"
					exit 1
				fi
				kurulu_kontrol "$2";;
			-suko)
				sunucu_kontrol ;;
			-cf|--config-file)
				if [ ! "$2" ]; then
					echo "ayardosyası gerek $1"
					exit 1
				fi
				ayar_dosyasi="$2"
				shift ;;
			-v)
				echo "$betikad $versiyon"
				exit 0 ;;
			-h|--help)
				yardim
				exit 0 ;;
			
		esac
		shift
	done
}
ana(){
ayarlar "$@"

if [ "$ikaynak" = "ag" ]; then
	
	echo "agdan cekiliyor:" "$2"
	#pkt=`cat "$paketdepo""paket.vt" | grep -w "$2" | cut -d' ' -f2` 
	pkt=`cat "$paketdepo""paket.vt" | grep "$2"# | cut -d' ' -f2`
	if [ ! -z "$pkt" -a "$pkt" != "" ]; then
		cpaket="${pkt/'#'/'%23'}"
		#paket sunucuda varsa
		wget -q --spider "$sunucu$cpaket"
		#if wget -P /tmp -q "$sunucu$cpaket" > /dev/null; then
		if [ $? -eq 0 ]; then
			wget -nc -P "$paketdepo" "$sunucu$cpaket"
			#mv /tmp/$pkt "$paketdepo"
			if [ "$kurulum_onay" = "evet" ];then
				kkont=`kurulu_kontrol "$2"`
				if [ "$kkont" = "degil" ];then
					icerik_ekle "$paketdepo$pkt"
					exit 1
				else
					echo "paket zaten kurulu!"
				fi
			fi
		fi
	fi
	exit 1
	
fi

if [ "$ikaynak" = "yerel" ]; then
	pkontrol=`basename $2 | grep -w "mps.xz"`
	if [ ! -z "$pkontrol" -a "$pkontrol" != "" ]; then
		kkont=`kurulu_kontrol "$2"`
		if [ "$kkont" = "degil" ];then
			icerik_ekle "$2"
		fi
	else
		echo "yerelde mps paketi bulunamadı."
	fi
fi

}
ana "$@"

#kurulum oncesi işler yapılır.
#paket içeriği hedefe çıkarılır.
#kurulum sonrası işler yapılır.
#paket veritabanı guncellenir.
#ldconfig tetiklenir.
#ek olarak çakışma ve güncelleme-geriçekme kontrolleri yapılır.
