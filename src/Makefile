install:
	install -d $(DESTDIR)/etc/cron.scripts
	install -d $(DESTDIR)/etc/init.d
	install -m755 cpu-performance-scaling.sh $(DESTDIR)/etc/cron.scripts/cpu-performance-scaling.sh
	install -m755 hdd-deadline-scheduler.sh $(DESTDIR)/etc/cron.scripts/hdd-deadline-scheduler.sh
	install -m755 network-queues.sh $(DESTDIR)/etc/cron.scripts/network-queues.sh
	install -m644 performance-tuner.init.d $(DESTDIR)/etc/init.d/performance-tuner
