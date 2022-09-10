# OdongDiary
Odong Diary는 영상 일기를 쓰는 앱입니다. 앨범에 있는 영상을 저장하고, 기록할 수 있습니다.

<img alt="image" src="https://user-images.githubusercontent.com/73867548/189175327-5c974ded-d0cd-4d04-b2ca-67397ebdb04d.png">     

- Toy Project (개인)
- 제작 기간: 2022.08.28 ~ 2022.09.03
- 기술 스택: SwiftUI, AVKit, CoreData
- Deployment target: iOS 15.0

<br>

# 구현 기능

| 일기장 등록 | 일기장 수정  |
|---|---|
| <center> <img src = "https://user-images.githubusercontent.com/73867548/189191798-e07b7778-a56c-4d5d-a753-de1f2fdc7c25.gif" width="60%"> </center> |  <img src = "https://user-images.githubusercontent.com/73867548/189190012-a98f5b93-29e7-4a35-9a85-9071e61b523c.gif" width="60%"> |
|  - 앨범에서 영상만 선택 가능 <br> - 일기장 영상, 제목, 내용이 작성되어야 완료 버튼 활성화 |     - 일기장 완료 유효성 검사 <br> - 뒤로 가기, 삭제시 Alert 구현  |

| 일기장 삭제 | 글자수 제한 |
|---|---|
| <img src = "https://user-images.githubusercontent.com/73867548/189189075-ba7d085c-aed1-4bac-bdb6-a6e99fb5160c.gif" width="60%"> | <img src = "https://user-images.githubusercontent.com/73867548/189189057-c359b40c-fcb6-4e28-92e0-481888e2c8f6.gif" width="60%"> |
| - 삭제시 경고 Alert 표시 | - 제목 15자, 내용 500자까지 입력 가능하도록 글자수 제한 <br> - 작성중 뒤로가기를 시도할 경우 경고 Alert 표시 |  

| 테마색 변경 기능  | 모든 일기장 삭제  |
|---|---|
| <img src = "https://user-images.githubusercontent.com/73867548/189189082-f7a0cbb7-3e21-4349-be57-9d0163b5f148.gif" width="60%">  |  <img src = "https://user-images.githubusercontent.com/73867548/189189095-3ff8dbf9-acd5-4da1-8923-6037929e53d0.gif" width="60%"> |
| - 원하는 테마 색상으로 변경 가능  |  - 모든 일기장을 영구적으로 삭제하는 기능 <br> - 삭제시 경고 Alert 표시 |

| 일기장 이름 변경 |  오래된순, 최신순 정렬  |
|---|---|
| <img src = "https://user-images.githubusercontent.com/73867548/189189071-b225950a-d80c-4f63-b722-5c797833559e.gif" width="60%">  | <img src = "https://user-images.githubusercontent.com/73867548/189189086-813a1c26-60b8-4331-af35-637d04ef8c55.gif" width="60%"> |
|  - 일기장 이름을 원하는대로 변경 가능 | - 일기장을 오래된순, 최신순으로 정렬하는 기능  |


<br>

# 프로젝트 경험 및 고민 내용

## CoreData로 영상 저장하기 
| 사용자를 위한 코드 vs 덜 복잡한 로직의 코드

OdongDiary는 CoreData로 기기에 직접 데이터를 저장하고 있습니다. 특히 영상을 어떻게 저장할지에 대해서 고민이 필요했습니다. 이에 대해서는 아래와 같은 세 가지 선택지가 있었습니다.

1. 앨범 URL을 저장하고 앨범의 영상에 직접 접근하기
2. 바이너리 데이터로 저장하기
3. 파일 매니저를 이용하여 새로운 파일로 저장한 후, 저장한 파일의 URL 가지기

먼저 앨범 URL을 저장하는 것은 데이터를 저장하는 앱인데에도 불구하고 앨범에 너무 의존적이라는 생각이 들었습니다. 앨범에서 해당 파일이 삭제되거나 유실되는 경우 앱에서 저장된 URL로 접근할 수 없는 상황이 발생하기 때문입니다.

그렇다면 따로 메모리를 차지하더라도, 영상을 `바이너리 데이터로 저장하는 방`법과 `FileManager로 새로운 파일을 쓰는 방법` 두 가지 방법 중에 선택하는 것이 앨범에 대한 의존성을 해결하는 방법일거라 생각되었습니다. 이 두 가지 방법에 대해서는 아래와 같이 비교할 수 있었습니다.

| 바이너리 데이터로 저장 | FileManager로 새로운 파일 쓰기 |
|---|---|
| - 별도의 폴더 및 파일 관리가 필요없음 <br> - 모델의 버전이 변경되어 마이그레이션을 하게 될 경우 속도가 매우 느림  |  - 따로 파일 및 폴더에 대해서 관리해야함 <br>  - 마이그레이션 시 속도가 빠름 |

성능과 그로 인해 발생하는 사용성에 대해서 생각해보면서 결과적으로는 FileManager로 새로운 파일을 쓰는 방법을 선택하게 되었습니다. 바이너리 데이터로 영상을 저장할 경우, 용량이 크기 때문에 마이그레이션이 발생할 때 데이터가 유실되는 상황과 속도가 매우 느려 답답한 사용성을 제공하는 상황을 피하고 싶었습니다.

물론 코어데이터 마이그레이션이 자주 일어나는 상황은 아닐 수 있으므로 FileManager로 파일을 읽고 쓰는 번거로운 과정을 생략하는 방향을 선택할 수도 있었습니다. 그러나 이 경우에는 영상을 저장하는 것이 앱의 핵심 기술이므로 번거롭더라도 파일을 관리하는 코드를 추가하여 사용자에게 좋은 사용성을 주는 것이 더 나은 소프트웨어가 되는 방향이라 생각하였습니다.

<br>

## SwiftUI와 MVVM
| 역할 나누기, 코드의 재사용

SwiftUI로 프로젝트를 진행했습니다. UI를 선언하는 선언형 프로그래밍과 Data를 Binding하는 데이터 주도(Data Driven) 프로그래밍을 경험해보며 새로운 프로그래밍을 맛볼 수 있었습니다. 또한 MVVM 구조를 경험해보고, 코드의 재사용성과 유지 보수를 위해 객체를 나누어내는 시도를 하였습니다.

UI를 구현하면서는 특히 테마 색상에 따라 앱의 Color를 바꾸어주는 기능을 구현하는 과정이 가장 기억에 남습니다. 싱글턴 패턴을 사용하여 전역에서 접근이 가능한 ColorSet을 만들어고 싶었는데 싱글턴 패턴을 사용할 경우 UI를 갱신시키지 못하는 문제가 있었고, 이를 @EnvironmentObject를 사용하여 해결하였습니다. SwiftUI의 ViewModel과 EnvironmentObject에 대한 미숙한 이해를 다듬을 수 있는 계기가 되었습니다.

<details>
<summary>프로젝트 디렉토리 구조 펼쳐보기</summary>
<div markdown="1">


```bash
├── App/
│   └── OdongDiaryApp.swift
├── CoreData/
│   ├── PersistenceController.swift
│   ├── CoreDataManager.swift
│   ├── Diary+CoreDataClass.swift
│   └── Diary.xcdatamodeld
├── Model/
│   └── DiaryModel.swift
├── View/
│   ├── Modifier/
│   │   └── isHidden.swift
│   ├── HomeView/
│   │   ├── HomeView.swift
│   │   ├── ViewModel/
│   │   │   └── HomeViewModel.swift
│   │   └── Views/
│   │       ├── TitleStackView.swift
│   │       ├── DiaryGridView.swift
│   │       └── DiaryGridCell.swift
│   ├── SettingView/
│   │   ├── SettingView.swift
│   │   └── Views/
│   │       ├── DiaryNameSettingView.swift
│   │       ├── ThemaColorSettingView.swift
│   │       ├── PaletteView.swift
│   │       └── SettingButtonStackView.swift
│   └── DiaryEditView/
│   │   ├── DiaryEditView.swift
│   │   ├── EditViewType.swift
│   │   ├── Views/
│   │   │   ├── NavigationBar/
│   │   │   │   ├── CompleteButton.swift
│   │   │   │   ├── EditButton.swift
│   │   │   │   ├── DeleteButton.swift
│   │   │   │   └── NavigationBackButton.swift
│   │   │   ├── VideoView/
│   │   │   │   ├── VideoView.swift
│   │   │   │   ├── CustomVideoPlayer.swift
│   │   │   │   └── VideoPickerView.swift
│   │   │   └── WriteView/
│   │   │       ├── WriteView.swift
│   │   │       ├── TitleView.swift
│   │   │       ├── TitleTextEditor.swift
│   │   │       └── BodyTextEditor.swift
│   │   └── ViewModel/
│   │       └── DiaryEditViewModel.swift
├── Util/
│   └── VideoFileManager.swift
├── Extension/
│   ├── URL+.swift
│   ├── UIApplicationKeyboard.swift
│   └── Date+.swift
├── Design/
│   ├── ColorPalette.swift
│   └── ColorSet.swift
└── Resource/
    ├── Assets.xcassets
    └── Preview Content/
        └── Preview Assets.xcassets
```

</div>
</details>


<br>
