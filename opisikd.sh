for paket in `cat $1`;do
		pisi bi "$paket" 
		pisi it *.pisi
done
