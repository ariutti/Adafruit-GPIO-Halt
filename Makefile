EXEC_1  = gpio-shutdown 
EXEC_2  = gpio-reboot

CFLAGS = -Wall -Ofast -fomit-frame-pointer -funroll-loops -s \
 -I/opt/vc/include \
 -I/opt/vc/include/interface/vcos/pthreads \
 -I/opt/vc/include/interface/vmcs_host \
 -I/opt/vc/include/interface/vmcs_host/linux \
 -L/opt/vc/lib
LIBS   = -lbcm_host
CC     = gcc $(CFLAGS)

all: $(EXEC_1) $(EXEC_2)

gpio-shutdown: gpio-shutdown.c
	$(CC) $< $(LIBS) -o $@
	strip $@
	
gpio-reboot: gpio-reboot.c
	$(CC) $< $(LIBS) -o $@
	strip $@

install:
	mv $(EXEC_1) /usr/local/sbin
	chown root:root /usr/local/sbin/$(EXEC_1)
	mv $(EXEC_2) /usr/local/sbin
	chown root:root /usr/local/sbin/$(EXEC_2)

clean:
	rm -f /usr/local/sbin/$(EXEC_1)
	rm -f /usr/local/sbin/$(EXEC_2)
