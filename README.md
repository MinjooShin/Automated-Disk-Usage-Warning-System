# :rotating_light: Automated Disk Usage Warning System

## Introduction
디스크 사용량 경고 시스템은 서버의 디스크 사용량을 모니터링하고 지정된 임계값을 초과할 경우 이메일로 알림을 보내는 간단한 bash 스크립트이다. 웹 서비스 중단과 데이터 손실을 방지하기 위해 서버의 디스크 공간이 부족해지지 않도록 관리한다.

## How It Work
스크립트는 특정 파티션(/dev/mapper/lvg0-lv--0)의 디스크 사용량을 체크하고 이를 사전에 정의된 임계값과 비교한다. 현재 디스크 사용량이 이 임계값을 초과하면 스크립트가 자동으로 이메일 알림을 보내 사용자에게 경고한다.

## Main Component
- 디스크 사용량 체크: df 명령어를 사용해 타겟 파티션의 디스크 사용량을 확인하고, awk 및 sed 명령어를 사용해 사용량을 추출한다.
- 임계값 비교: 현재 디스크 사용량을 설정된 임계값(기본값은 90%)과 비교한다. 사용량이 임계값보다 높으면 경고 조건이 활성화된다.
- 이메일 알림: mail 명령어를 사용해 사전에 정의된 수신자에게 현재 디스크 사용량을 포함한 이메일 알림을 보낸다.

## Setting
1. 모니터링하고자 하는 서버에 dailyCheck_diskUsage.sh 파일을 배치한다.
2. 스크립트 파일에 실행 권한을 부여한다. (chmod +x dailyCheck_diskUsage.sh)
3. 정기적인 모니터링을 위해 크론탭에 다음과 같이 설정한다.

```shell
00 0 * * * /home/minjoo/manage_server/dailyCheck_diskUsage.sh >> /home/minjoo/manage_server/dailyCheck_diskUsage.log 2>&1
```

## Dependency
이메일 알림을 보낼 수 있도록 서버에 mail 유틸리티가 설치되어 있어야 한다.

## Result
![image](https://github.com/MinjooShin/ServerStatus-Notification/assets/74174008/1328415f-440a-4221-bc82-4a09364a559a)

