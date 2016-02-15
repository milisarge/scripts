#!/bin/bash
versiyon="0.1"
paketdepo="/depo/paketler/"
sunucu="192.168.3.193:8000/paketdepo/"
ikaynak=""

icerik_ekle(){
	paketad=`echo "$1" | cut -d'#' -f1`	
	paketad=`basename $paketad`
	echo $paketad" paketi kuruluyor."
	mkdir -p /var/lib/pkg/DB/"$paketad" &&
	tar xf $1 -C /  && 
	mv /.MTREE /var/lib/pkg/DB/"$paketad"/files &&
	mv /.META /var/lib/pkg/DB/"$paketad"/META &&
	echo $paketad" paketi kuruldu."
}

paket_sil(){
	local paket kkont
	kkont=`kurulu_kontrol "$1"`
	if [ "$kkont" = "kurulu" ];then
		paket="$1"
		dokunulmaz="/etc/dokunulmaz"
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

}

kurulu_kontrol(){
	if [ -d "/var/lib/pkg/DB/$1" ];then
		echo "kurulu"
		exit 1
	fi
	echo "degil"
}

paketvt_guncelle(){
	if wget -P /tmp -q "$sunucu""paket.vt" > /dev/null; then
		echo "paket veritabanı guncellenıyor." "$paketdepo""paket.vt"
		if [ -f "$paketdepo""paket.vt" ];then
			mv "$paketdepo""paket.vt" "$paketdepo""paket.vt.eski"
		fi
		wget -P "$paketdepo" "$sunucu""paket.vt"
		rm /tmp/paket.vt*
		exit 1
	fi
	echo "paket veritabanı guncelleme olumsuz."
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
			-ak|--agdan)
				ikaynak="ag" ;;
			-yk|--yerelden)
				ikaynak="yerel" ;;
			-s|--paket-sil)
				paket_sil "$2" ;;
			-vtg|--vt-guncelle)
				paketvt_guncelle ;;
			-kk|--kurulu-kontrol)
				kurulu_kontrol "$2" ;;
			-cf|--config-file)
				if [ ! "$2" ]; then
					echo "ayardosyası gerek $1"
					exit 1
				fi
				ayar_dosyasi="$2"
				shift ;;
			-v|--version)
				echo "mps $versiyon"
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
	kkont=`kurulu_kontrol "$2"`
	if [ "$kkont" = "degil" ];then
		echo "agdan cekiliyor:" "$2"
		pkt=`cat "$paketdepo""paket.vt" | grep -w "$2" | cut -d' ' -f2` 
		if [ ! -z "$pkt" -a "$pkt" != "" ]; then
			cpaket="${pkt/'#'/'%23'}"
			#paket sunucuda varsa
			if wget -P /tmp -q "$sunucu$cpaket" > /dev/null; then
				#wget -nc -P "$paketdepo" "$sunucu$cpaket"
				mv /tmp/$pkt "$paketdepo"
				icerik_ekle "$paketdepo$pkt"
				exit 1
			fi
		fi
		echo "paket sunucuda bulunamadı!"
	else
		echo "paket zaten kurulu!"
	fi
fi

if [ "$ikaynak" = "yerel" ]; then
	pkontrol=`basename $2 | grep -w "mps.xz"`
	if [ ! -z "$pkontrol" -a "$pkontrol" != "" ]; then
		kkont=`kurulu_kontrol "$2"`
		if [ "$kkont" = "degil" ];then
			icerik_ekle "$2"
		fi
	fi
fi

}
ana "$@"

