FROM rockylinux:9

# 필수 패키지 설치
RUN dnf install -y openssh-server passwd && \
    dnf clean all

# SSH 키 생성
RUN ssh-keygen -A

# root 비밀번호 설정
RUN echo "root:1234" | chpasswd

# root 로그인 허용, 패스워드 인증 허용
RUN sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#\?UsePAM.*/UsePAM yes/' /etc/ssh/sshd_config

# 쉘 설정 (혹시라도 /sbin/nologin 되어 있을 경우 대비)
RUN usermod -s /bin/bash root

# 포트 오픈
EXPOSE 22

# SSH 데몬 실행 (포그라운드)
CMD ["/usr/sbin/sshd", "-D"]

