gcc -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python3.5m -o yourmod.so yourmod.c
#py to binary
cython --embed -o dhtbil.c dhtbil.py
gcc `python3-config --cflags --ldflags` dhtbil.c -o dhtbil
gcc -I /usr/include/python3.5m/ -L /usr/lib/python3.5 -lpython3.5m dhtbil.c -o dhtbil
