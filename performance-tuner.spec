%define _builddir	.
%define _sourcedir	.
%define _specdir	.
%define _rpmdir		.

Name:		performance-tuner
Version:	0.1
Release:	1

Summary:	Scripts that tune performance of CPUs, disks and network
License:	MIT
Group:		System Environment/Libraries
Distribution:	Red Hat Enterprise Linux

BuildArch:	noarch

BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root


%description
Scripts that tune performance of CPUs, disks and network


%prep


%build


%install
%{__rm} -rf %{buildroot}

%{__make} -C src DESTDIR=%{buildroot} install


%clean
rm -rf $RPM_BUILD_ROOT

%post
if [ $1 -eq 1 ] ; then
	chkconfig --add performance-tuner
	chkconfig performance-tuner on
else
	chkconfig performance-tuner on
fi
/etc/init.d/performance-tuner start
exit 0

%preun
if [ $1 -eq 0 ] ; then
	chkconfig --del performance-tuner
fi

%files
%defattr(-,root,root)
%attr(0755,root,root) /etc/cron.scripts/cpu-performance-scaling.sh
%attr(0755,root,root) /etc/cron.scripts/hdd-deadline-scheduler.sh
%attr(0755,root,root) /etc/cron.scripts/network-queues.sh
%attr(0755,root,root) /etc/init.d/performance-tuner


