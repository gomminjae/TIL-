# API 사용하기1 (Model 작성 with Swift)
# 들어가기전에 
오늘은 FASTCAMPUS IOS개발 온라인 강의에서 나온 apple API를 사용하여 영화제목과 사진, preview영상을 검색 또는 불러오는 작업을 해보겠습니다. 

# 데이터를 담을 Model 구현하기 
먼저 소스를 보겠습니다.
```swift
struct Movie: Codable {
    let title: String
    let director: String
    let thumbnailPath: String
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case director = "artistName"
        case thumbnailPath = "artworkUrl100"
        case previewURL = "previewUrl"
    }
    
}
struct Response: Codable {
    let resultCount : Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case movies = "results"
    }
}
```
먼저 Movie struct에는 영화의 제목, 감독, 사진의 경로 미리보기 영상의 경로 정보가 담겨있습니다. 이 앱에서 저는 영화 포스터와 영상은 URL정보를 가져와서 불러오는 방법을 사용하였습니다. 

# CodingKey? 
<strong><u>apple API에 저장된 데이터들의 변수 이름에 맞춰서 불러오기 위해서 사용합니다.</strong></u> 예를 들어 Superman이라는 영화를 검색하였을때 API속 데이터에는 trackName=Superman, director="" 이런식으로 저장되어 있는 데이터를 불러와야 합니다. 따라서 영화 데이터를 원하는 변수에 알맞게 가져오기 위해서 title에는 trackName에 해당되는 데이터를 불러오겠다! 라고 정의하기 위해서 enum CodingKey를 이용해줍니다. 정확한 CodingKey string을 정의해주셔야 정확한 데이터 처리가 가능합니다. 따라서 API를 사용하기 전에 각 데이터 변수의 이름을 체크해주셔야 합니다. 

# Movie, Response 
<strong>이 두 struct들은 모두 Codable 프로토콜을 이용합니다.</strong> api에서 json형식으로 불러온 데이터를 decode하여 원하는 타입의 데이터로 변환시켜야 하기 때문입니다.😄 API에서 응답을 받으면 결과개수와 먼저 선언한 Movie 타입의 데이터가 입력됩니다. 

