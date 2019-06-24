FROM centos

RUN yum update -y \
 && yum install -y http://www.city-fan.org/ftp/contrib/yum-repo/city-fan.org-release-2-1.rhel7.noarch.rpm \
                   epel-release \
                   rpm* rpm-build rpmdev* \
                   gcc \
                   krb5-devel \
                   openldap-devel \
                   groff \
                   make \
                   openssl-devel \
                   zlib-devel \
                   gnutls-utils \
                   openssh-clients \
                   openssh-server \
                   stunnel \
 \
 && yum install -y --enablerepo="city-fan*" \
                   libmetalink-devel \
                   libnghttp2-devel \
                   nghttp2 \
                   libpsl-devel \
                   libssh2-devel \
                   perl-IO-Compress \
                   perl-Digest \
 \
 && rpm -i http://www.city-fan.org/ftp/contrib/yum-repo/rhel7/source/curl-7.65.1-1.0.cf.rhel7.src.rpm \
 && cd /root/rpmbuild/SPECS \
 && rpmbuild --without nss -bb curl.spec \
 && cd - \
 && mv -f /root/rpmbuild/RPMS/x86_64/*.rpm / \
 && yum history undo 3 \
 && rm -rf /root/rpmbuild
