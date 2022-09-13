# 백자일기

### 1. 앱 소개 / 특징

언젠가 잊혀질 소중한 오늘을 간단히 기록해보세요!

백자일기는 감정 이모티콘과 최대 100 글자를 통해 하루를 기록하는 초간단 일기앱입니다.

짧은 시간동안 당신의 하루를 정리할 수 있어요.



### 2. 앱 UI/UX

![스크린샷 2022-08-30 오후 6.34.51](/Users/tason/Library/Application Support/typora-user-images/스크린샷 2022-08-30 오후 6.34.51.png)

(피그마 링크 : https://www.figma.com/file/HK9gs9Iw8crmAkWkWxsm5x/SeSAC_%EB%B0%B1%EC%9E%90%EC%9D%BC%EA%B8%B0_APP?node-id=0%3A1)



### 3. 앱 기능

백자일기는 이런 기능을 제공해요.

- 월별 캘린더 (탭바 첫번째)
  - 작성한 날의 감정 이모티콘을 모아 월 단위로 확인할 수 있어요.
  - 작성 이모티콘 별로 수치화된 정보를 확인할 수 있어요.
  - 기록과 관련된 명언을 확인할 수 있어요.
  - 캘린더의 특정날을 탭하면 상세기록화면으로 이동해요.
- 전체 기록 리스트 (탭바 두번째)
  - 기록된 일기 리스트를 확인할 수 있어요. 
  - 연별로도 확인이 가능해요.
  - 특정날을 탭하면 상세기록화면으로 이동해요.
- 일기 작성하기 (탭바 세번째)
  - 오늘의 감정 이모티콘을 선택할 수 있어요.
  - 최대 백자의 일기를 작성할 수 있어요.
  - 하나의 사진을 저장할 수 있어요.
- 상세기록화면 
  - 월별 캘린더 화면과 전체 기록 리스트 화면에서 특정 일자를 클릭하면 이동되는 화면이에요.
  - 해당 날짜의 감정 이모티콘, 일기, 사진을 확인할 수 있어요.
  - 우측 상단의 수정 버튼을 탭하면 일기 작성하기 화면으로 이동해요. 이 때 기존 정보는 유지되요.
- 설정 (탭바 네번째)
  - 언어변경을 통해 사용할 언어를 선택할 수 있어요.
  - 알림 설정을 통해 백자일기와 관련된 알림을 수신할 수 있어요. (ex. 오늘 작성 여부)
  - 백업/복구 기능을 통해 앱 재설치/단말기 변경을 하더라도 기존 데이터를 유지할 수 있어요.
  - 백자일기 앱 개발에 활용된 오픈소스 라이센스를 확인할 수 있어요.
  - 애플스토어에서 백자일기 앱에 대한 개선사항/느낌 등을 평가할 수 있어요.



### 4. 개발 공수

![스크린샷 2022-08-30 오후 9.44.06](/Users/tason/Library/Application Support/typora-user-images/스크린샷 2022-08-30 오후 9.44.06.png)

(엑셀 링크 : https://o365halla-my.sharepoint.com/:x:/g/personal/201447015_hu_halla_ac_kr/EYaONZGZUJZJsSwo6kEVLgoBsPaaay8hwCpRQVCJvI0b1Q?rtime=_MKsPoWK2kg)



![스크린샷 2022-08-30 오후 10.00.27](/Users/tason/Library/Application Support/typora-user-images/스크린샷 2022-08-30 오후 10.00.27.png)



### 5. 개발일지

- 09/13(화)

  ~~~
  1. 진행 및 완료 상황
  	- 탭바 / 캘린더 커스텀
  2. 개발 중 발생한 이슈/고민
  	- 기획은 명확하지만 디자인이 불명확하다. -> 개발하면서 UI 만드는 시간이 굉장한 시간이 든다.
  	- 공수산정 일정이 미뤄지고 있다.
  	- 하지만 디자인 및 UI가 완성되면 로직 처리는 계획보다 빠르게 개발할 수 있을 것 같다.
  	- 스택뷰 코드 개발 실패 -> UI 요소 각각 코드로 레이아웃 조절
  3. 새로 배운 내용
  	- 작성화면 로직을 고려하기 위해 탭바 수정 -> 탭바 가운데 버튼 넣어주는 방법
  	- FSCalendar의 날짜뷰를 커스텀하여 배경으로 이미지 넣는 법
  4. 기타
  	- 석준님이 말하길, UIButton 이미지 크기 조절하는 방법이 있다고 하는데 나중에 참고할 예정
  	- 희철님은 탭바 아이콘에 외부 이미지를 넣었다고 한다. (25 * 25) -> 나는 SystemImage가 여러 기기 적용에 더 안전하다고 생각했다.
  	- 선우님에게 각 기기별 분기처리하는 코드 알려줌
  	- 다들 외부 이미지에 대한 저작권 처리 고민을 갖고 있는 듯
  ~~~

  