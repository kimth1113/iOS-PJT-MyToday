# 나는오늘

### 1. 앱 소개 / 특징

언젠가 잊혀질 소중한 오늘을 간단히 기록해보세요!

<나는오늘>은 깜찍한 캐릭터와 한장의 사진 그리고 일기를 통해 하루를 기록하는 초간단 일기앱입니다.

짧은 시간동안 당신의 하루를 정리할 수 있어요.



### 2. 앱 UI/UX

![mainScreen](readme.assets/mainScreen.png)

초기 피그마 링크 : https://www.figma.com/file/HK9gs9Iw8crmAkWkWxsm5x/SeSAC_%EB%B0%B1%EC%9E%90%EC%9D%BC%EA%B8%B0_APP?node-id=0%3A1



### 3. 앱 기능

<나는오늘>은 이런 기능을 제공해요.

- 캘린더 (탭바 첫번째)
  - 작성한 날의 감정 이모티콘을 모아 월 단위로 확인할 수 있어요.
  - 작성 이모티콘 별로 수치화된 정보를 확인할 수 있어요.
  - 기록과 관련된 명언을 확인할 수 있어요.
  - 캘린더의 특정날을 탭하면 상세기록화면으로 이동해요.
- 일기모음 (탭바 두번째)
  - 기록된 일기 리스트를 확인할 수 있어요. 
  - 연별로도 확인이 가능해요.
  - 특정날을 탭하면 상세기록화면으로 이동해요.
- 일기 작성 (탭바 중앙 연필 버튼)
  - 오늘의 감정 이모티콘을 선택할 수 있어요.
  - 최대 백자의 일기를 작성할 수 있어요.
  - 하나의 사진을 저장할 수 있어요.
- 한달 요약 (탭바 세번째)
  - 월별 캘린더 화면과 전체 기록 리스트 화면에서 특정 일자를 클릭하면 이동되는 화면이에요.
  - 해당 날짜의 감정 이모티콘, 일기, 사진을 확인할 수 있어요.
  - 우측 상단의 수정 버튼을 탭하면 일기 작성하기 화면으로 이동해요. 이 때 기존 정보는 유지되요.
- 설정 (탭바 네번째)
  - 사용하고 있는 앱의 버전을 확인할 수 있어요.
  - 앱스토어로 이동하여 <나는오늘> 앱에 대한 개선사항/느낌 등을 평가할 수 있어요.
  - 앱 개발에 사용된 오픈소스 라이센스 정보를 확인할 수 있어요.
  - 우발적인 버그나 피드백 등에 대한 내용을 작성하여 개발자의 메일로 전송할 수 있어요.



### 4. 개발 공수

초기 엑셀 링크 : https://o365halla-my.sharepoint.com/:x:/g/personal/201447015_hu_halla_ac_kr/EYaONZGZUJZJsSwo6kEVLgoBsPaaay8hwCpRQVCJvI0b1Q?rtime=_MKsPoWK2kg



### 5. 개발일지


- 09/20(화)

  ~~~
  # 진행 및 완료 상황
  1. 리스트화면
  	- 화면 구성 완료
  		-> 상단 헤더뷰: 검색 버튼과 월별 선택 라벨 버튼 위치할 예정
      -> 이모티콘 리스트 컬렉션뷰: 특정 이모티콘 탭 시 해당 이모티콘이 저장된 일기 렌더링할 예정
      -> 일기 리스트 테이블뷰
  	
  # 개발 중 발생한 이슈/고민
  	- 이미지 저장 여부와 일기 작성 여부에 따라서 셀 영역을 동적으로 조절하고 싶었으나, 스택뷰 코드개발이 쉽지 않음
  		-> 셀의 동적인 크기에 맞춰서 estimatedRowheight 속성 적용
  		-> 이미지와 일기 내용을 한 스택뷰에 넣고 둘 중 하나가 없으면 해당 영역을 안보이게 하고 싶으나 실패
  		-> 대체방안으로 아예 커스텀 셀을 여러개 만들어서 각 경우에 적용할 예정
  		
  # 향후 계획
  	- 중간발표까지 두번째 탭(일기리스트) 디자인/로직 완료, 첫번째탭과 Alert 창 디자인 완료
  ~~~

- 09/15~09/19(화)

  ~~~
  # 진행 및 완료 상황
  1. 캘린더 화면
  	- 캘린더 화면 디자인 80%
  	- 달 헤더의 양쪽 화살표 버튼을 탭하여 월별 이동 가능
  	- 특정 날짜 탭할 경우
  		-> 오늘 또는 과거일 경우: 기존 일기가 존재하면 Read 화면으로 이동 / 존재하지 않으면 Create 화면으로 이동
  		-> 내일 이상일 경우: Calendar/didSelect에서 분기처리하여 탭 무시
  	- 일기를 쓴 날에는 해당 날짜의 배경에 이미지 표시
  2. 탭바 컨트롤러 상태와 작성화면 간 연결 PencilAlertView (연필버튼을 탭하면 나타남)
  	- PencilAlertView 디자인 30%
  	- 오늘/어제 버튼: 탭할 경우 해당 날짜의 작성화면으로 이동
  	- 특정날 버튼: 탭할 경우 isHidden 처리되어있던 datePicker와 확인 버튼이 나타나고 특정 날짜 선택 후 확인 버튼 탭으로 작성화면 이동
  	- 작성화면 데이터 바인딩: 기존 일기가 존재하면 기존 Diary 객체의 이모티콘, 이미지, 일기 바인딩 / 존재하지 않으면 빈 칸으로 제공
  3. Diary Realm 모델 및 이미지 저장
  	- objectId: "yyyy-MM-dd" String 형식 -> 어짜피 날짜당 하나의 일기만 작성 가능하기 때문
  	- emoticonId: 0~9 중 한 숫자인 Int 형식 -> 이모티콘 이미지 저장이 아닌 Int 타입 저장으로 앱 용량 최소화 및 emoticonId 분기처리를 통한 이모티콘 이미지 바인딩
  	- content: 일기 내용의 String? 형식 -> 필수 아님
  	- [Document] 이미지 저장 방식: 이미지 저장은 한 장만 가능하며 필수 아님
  		-> 저장한 이미지 이름은 objectId와 동일
  3. 작성화면
  	- 작성화면 디자인 80%
  	- 작성화면 가기 전인 PencilAlertView에서 해당하는 Diary 데이터 전달
  		-> 기존 데이터가 있다면 그대로 전달
  		-> 기존 데이터가 없다면 Diary(objectId: 해당 날짜, emotionId: 0, content: nil)
  	- 이모티콘 선택뷰: CustomView/EmoticonListView 내부에 9개 이모티콘 버튼을 스택뷰로 커스텀
  		-> emoticonId가 0일 경우: 9개 이미지가 그대로 있고, 특정 이미지 선택 시 확대/축소 반복효과 지속
  		-> emoticonId가 0이 아닌 경우: Controller 클래스 내부에 이미지 리스트를 emoticonId를 통해 인덱싱해서 가져옴
  	- 일기 내용 영역과 실제 작성 AlertView
  		-> 일기 내용 영역을 탭할 시, 실제 작성할 수 있는 AlertView Present
  		-> AlertView의 작성되는 영역 textView로, 키보드 위까지 설정하여 실시간 커서에 맞춰 자동 스크롤
  		-> 우상단 버튼 탭 시 일기 내용 영역이 최신화
  	- 이미지
  		-> UIViewController+Extension/loadImageFromDocument(fileName: String): Document 폴더에 fileName 이름의 이미지가 있으면 해당 이미지 반환, 없으면 nil 반환
  	- newEmoticonId, newContent 변수: 이모티콘 선택 및 일기 작성 시점 마다 최신화하여 새로 작성 또는 수정 시 최신화된 Diary 저장
  	- 스크롤뷰 구현: 일기 내용의 길이에 맞춤
  4. 보기화면
  	- 보기화면 디자인 80%
  	- 캘린더 화면에서 일기가 작성된 날짜를 탭하면 이동
  	- 기존 데이터를 그대로 바인딩: 이미지 또는 일기가 nil일 경우 빈칸 또는 플레이스홀더 지정
  	- 스크롤뷰 구현: 일기 내용의 길이에 맞춤
  	- 우상단 버튼을 통해 작성화면으로 이동: 기존 데이터 전달
  	
  # 개발 중 발생한 이슈/고민
  	- 스택뷰 코드 적용 완료 -> UIStackView(arrangedSubviews: [~])
  		-> 처음에는 스택뷰.addSubview(~)하면 되는 줄 앎
  	- 작성화면에서 작성 및 수정 후 dismiss해서 캘린더 화면으로 돌아오면 최신화 안됨 (앱을 다시 키거나 캘린더 달을 바꿔야 최신화)
  		-> 탭바 상의 캘린더 화면은 그대로인 상태에서 작성화면이 Present되기 때문에 Dismiss해도 그대로 유지
  		-> 작성뷰에 reloadCalendar 옵셔널클로져 선언하고, PencilAlertView에서 캘린더 최신화 클로져 전달
  	- 폰트 적용 완료
  		-> 폰트 다운 및 폴더 이동 후 Target Membership까지 체크했으나 적용이 안됨
  		-> system 내부에서 사용하는 폰트 명이 따로 있었음
  		-> 터미널 창에 모든 폰트명 프린트 후 골라서 적용
  		
  # 향후 계획
  	- 개발 일정과 공수 산정 다시 설정
  	- 09/20 두번째 탭 개발 시작
  	- 지금은 디자인에 너무 많은 시간 쏟지 말자
  ~~~

- 09/14(수)

  ~~~
  1. 진행 및 완료 상황
  	- 탭바 / 캘린더 커스텀
  2. 개발 중 발생한 이슈/고민
  	- 큰일났다. 오늘 작성화면 마무리하고 스키마 만드려고 했는데, 모두 못했다.
  	- 작성화면에서 스크롤뷰를 구현하려고 했는데 배경 이미지가 깨지고 탭바 배경색과 Radius가 초기화되는 난리가 있었다.
  	- 우선 스크롤뷰를 테이블뷰로 대체하려고 한다.
  3. 새로 배운 내용
  	- 스택뷰 코드로 구현하는 방법
  	- 스크롤뷰 코드로 구현하는 방법 (하지만 적용실패)
  4. 기타
  	- 승후님이 버튼 탭하면 피커가 나타나는 방법 알려주심
  	- 석준님은 계획대로 척척 하셔서 부러웠다.
  	- 희철님은 이미지를 편집해서 가져오는 로직을 구현했는데 인상깊었다.
  	- 캠프파이어방에서 게임을 했는데 개꿀잼. 확실히 세상이 많이 발전했다.
  ~~~

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
  	- Status Bar 색상조정하는 방법
  	- 작성화면 로직을 고려하기 위해 탭바 수정 -> 탭바 가운데 버튼 넣어주는 방법
  	- FSCalendar의 날짜뷰를 커스텀하여 배경으로 이미지 넣는 방법
  4. 기타
  	- 석준님이 말하길, UIButton 이미지 크기 조절하는 방법이 있다고 하는데 나중에 참고할 예정
  	- 희철님은 탭바 아이콘에 외부 이미지를 넣었다고 한다. (25 * 25) -> 나는 SystemImage가 여러 기기 적용에 더 안전하다고 생각했다.
  	- 선우님에게 각 기기별 분기처리하는 코드 알려줌
  	- 다들 외부 이미지에 대한 저작권 처리 고민을 갖고 있는 듯
  ~~~

- ~ 10/26(수)

  ~~~
  1. 캘린더 화면 완성
  	- 작성한 날의 감정 캐릭터를 모아 캘린더에서 한눈에 확인
   	- 캘린더의 특정날을 탭하면 작성화면으로 이동
  2. 일기작성 화면 완성
  	- 오늘, 어제 또는 다른날의 일기작성화면으로 이동
   	- 캘린더의 특정날을 탭하면 작성화면으로 이동해요.
  3. 일기 모음 화면 완성
  	- 기록된 일기 리스트 확인
  	- 특정 일자를 클릭하면 작성화면으로 이동
  4. 한달요약 화면 완성
  	- 한달의 감정, 작성 일기 수, 랜덤이미지 확인
   	- 작성 이모티콘 별로 수치화된 정보를 확인
  5. 기존에 기획했던 작성 일기 기반의 키워드 빈도 분석 기능 실패
  	-> 공공 인공지능 오픈 API/DATA 담당자로부터 거절 (사유: 한정된 컴퓨팅 자원)
  ~~~

### 6. 개인정보처리방침

*< 개인 >('https://shimmering-catshark-05c.notion.site/58ad1a'이하 '개인 노션')*은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

○ 이 개인정보처리방침은 *2022*년 *10*월 *3*부터 적용됩니다.

**제1조(개인정보의 처리 목적)\*< 개인 >('https://shimmering-catshark-05c.notion.site/58ad1a'이하 '개인 노션')\*은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.**

1. 홈페이지 회원가입 및 관리

해당사항 없음 목적으로 개인정보를 처리합니다.

1. 민원사무 처리

해당사항 없음 목적으로 개인정보를 처리합니다.

1. 재화 또는 서비스 제공

해당사항 없음을 목적으로 개인정보를 처리합니다.

1. 마케팅 및 광고에의 활용

해당사항 없음 등을 목적으로 개인정보를 처리합니다.

1. 개인영상정보

해당사항 없음 등을 목적으로 개인정보를 처리합니다.

1. 기타

해당사항 없음 등을 목적으로 개인정보를 처리합니다.

**제2조(개인정보의 처리 및 보유 기간)**① *< 개인 >*은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

**제3조(처리하는 개인정보의 항목)**① *< 개인 >*은(는) 다음의 개인정보 항목을 처리하고 있습니다.

- 1< 홈페이지 회원가입 및 관리 >
- 필수항목 : 해당사항 없음
- 선택항목 :

**제4조(개인정보의 파기절차 및 파기방법)**

*① < 개인 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.1. 법령 근거 :2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.1. 파기절차< 개인 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 개인 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.*

