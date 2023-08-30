# Week 3

# Dart 비동기 프로그래밍

## Future

`Future` 는 비동기 연산의 결과를 나타내는 객체이다. 이곳에 미래에 들어갈 값들이 들어갑니다.

Future를 쓰는 이유는, 어떤 시간이 오래 걸리는 연산의 경우 그 결과를 기다리지 않고, 다른 작업을 하다가, 만약에 그 결과가 나왔을 때 화면에 표시하기 위해서입니다.

Future의 결과는 두 가지인데, ‘성공’과 ‘실패’입니다.

```dart
Future<String> fetchUserData() async {
  // ... 데이터 가져오기 ...
  return 'UserData';
}

void main() {
  fetchUserData().then((data) {
    print(data); // UserData 출력
  });
}
```

`Future.then()`, `Future.catchError()`와 같은 메서드들을 통해 연산이 완료됐을 때 실행될 콜백을 설정할 수 있습니다.

## Async / Await

Future 객체를 반환하기 위해서는 반드시 비동기 함수를 나타내는 `async` 키워드를 붙여야 합니다.

그리고 `await` 함수는, 비동기 함수를 동기 함수로 다루는 키워드로, 비동기 함수의 결과가 끝이 날 때까지 기다립니다.

```dart
Future<void> printUserData() async {
  String data = await fetchUserData();
  print(data);
}
```

## Stream

`Stream`은 연속적인 비동기 이벤트 시퀀스를 나타내는 객체입니다.

```dart
Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() {
  countStream(5).listen((data) {
    print(data); // 1부터 5까지 차례대로 출력
  });
}
```

지속적으로 값이 변하게 될 때, `Stream` 객체를 사용할 수 있습니다.

예를 들어 다음과 같이 사용할 수 있습니다.
```dart
Stream<List<Post>> getPostsByCommunityId(String communityId) {
    try {
      return _postsCollection
          .where('communityId', isEqualTo: communityId)
          .orderBy('postCreatedTime', descending: true)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => Post.fromSnapshot(doc))
            .toList(growable: false);
      });
    } catch (e) {
      logger.e('Error: $e');
      return const Stream.empty();
    }
  }
```

## Future / Async / Await를 사용하는 이유

예를 들어서 API 요청을 할 때, 네트워크를 타고 요청을 주고 응답을 받는 것은 시간이 다소 오래 걸리는 작업입니다. async 함수로 만들어서 이 요청을 보낼 때, 굳이 결과가 필요없는 작업을 처리하다가, 결과가 도착하면 그에 맞춰서 필요한 행동을 처리할 수 있습니다.

# Flutter 기본 위젯

Flutter의 모든 위젯은 최상위 베이스 클래스인 `Widget` 클래스를 상속받고 있습니다. 그리고 이를 상속받는 두 가지 클래스, `StatefulWidget` 과 `StatelessWidget` 으로 나뉩니다.

|  | stateless | stateful |
| --- | --- | --- |
| 상태 변경 | X | O |
| 특징 | 화면을 갱신할 필요가 없기에적은 자원으로 화면 구성 | 상태가 변경되면 화면을 다시 갱신을 해야되기에 stateless 보다 CPU와 메모리 등 자원을 많이 소비함 |

> **Text** (텍스트를 출력해주는 위젯)
**Scaffold** (머터리얼 스타일 디자인의 레이아웃 구조물,
                 *material design visual layout structure*)
**Appbar** (상단 네비게이션바 출력해주는 위젯)
**MaterialApp** (theme 속성의 `primarySwatch` 색상만 바꿔봅니다.)
> 

Flutter는 `MaterialApp` 안에서 위젯을 그려야 하며, 이 안에 또 `Scaffold` 앱 안에서 Material widget들을 사용할 수 있답니다.

## Center

> child 가운데 배치
> 

```dart
const Center(
  child: Text('Flutter My Home Page'),
)
```

## Container

> child 레이아웃 위젯
> 

```dart
body: Container(
  color: Colors.yellow,
  alignment: Alignment.centerLeft,
  padding: const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 50,
  ),
  margin: const EdgeInsets.symmetric(
    horizontal: 50,
    vertical: 50,
  ),
  width: 100,
  height: 300,
  child: const Text('Flutter My Home Page'),
),
```

![Untitled](Week%203/Untitled.png)

### Alignment

```dart
// x = 0 center
// y = 0 center
alignment: const Alignment(1, -1.1),
```

x축

- -1  left
- 0 center
- 1 right

y축

- 1 bottom
- 0 center
- -1 top

![Untitled](Week%203/Untitled%201.png)

 

### + padding (Padding Widget)

```dart
body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Flutter My Home Page',
        ),
      ),
```

### + alignment (Align Widget)

```dart
body: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Flutter My Home Page',
        ),
      ),
```

## SizedBox

> child 사이즈 설정
> 

```dart
body: const SizedBox(
  width: 200,
  height: 200,
  child: Text(
    'Flutter My Home Page',
  ),
)
```

![Untitled](Week%203/Untitled%202.png)

## Column (열, 세로 축)

```dart
body: Column(
  children: [
    Container(
      color: Colors.red,
      width: 150,
      height: 300,
      child: const Text(
        '1',
      ),
    ),
    Container(
      color: Colors.yellow,
      width: 150,
      height: 300,
      child: const Text(
        '2',
      ),
    ),
    Container(
      color: Colors.green,
      width: 150,
      height: 300,
      child: const Text(
        '3',
      ),
    ),
  ],
),
```

![Untitled](Week%203/Untitled%203.png)

### mainAxisSize

```dart
mainAxisSize: MainAxisSize.min,
```

![Untitled](Week%203/Untitled%204.png)

### mainAxisAlignment

```dart
mainAxisAlignment: MainAxisAlignment.center,
```

![Untitled](Week%203/Untitled%205.png)

## Row (행, 가로 축)

```dart
body: Row(
  children: [
    Container(
      color: Colors.red,
      width: 150,
      height: 300,
      child: const Text(
        '1',
      ),
    ),
    Container(
      color: Colors.yellow,
      width: 150,
      height: 300,
      child: const Text(
        '2',
      ),
    ),
    Container(
      color: Colors.green,
      width: 150,
      height: 300,
      child: const Text(
        '3',
      ),
    ),
  ],
),
```

![Untitled](Week%203/Untitled%206.png)

### mainAxisSize

```dart
mainAxisSize: MainAxisSize.min,
```

![Untitled](Week%203/Untitled%207.png)

### mainAxisAlignment

```dart
mainAxisAlignment: MainAxisAlignment.center,
```

![Untitled](Week%203/Untitled%208.png)

## Wrap

overflow났을 때 다음 줄로 내리고싶을때

> children에 공간이 부족해지면 자동으로 다음 줄로 바꿔줍니다
> 

```dart
body: Wrap(
	// direction: Axis.vertical,
	children: [
	  Container(
	    color: Colors.red,
	    width: 150,
	    height: 300,
	    child: const Text(
	      '1',
	    ),
	  ),
	  Container(
	    color: Colors.yellow,
	    width: 150,
	    height: 300,
	    child: const Text(
	      '2',
	    ),
	  ),
	  Container(
	    color: Colors.green,
	    width: 150,
	    height: 300,
	    child: const Text(
	      '3',
	    ),
	  ),
	],
	),
```

![Untitled](Week%203/Untitled%209.png)

## Stack

겹쳐서 위젯을 출력하고 싶을 때

> children의 위젯들을 겹쳐서 출력합니다
> 

```dart
body: Stack(
  alignment: Alignment.center,
  children: [
    Container(
      color: Colors.red,
      alignment: Alignment.center,
      width: 100,
      height: 200,
      child: const Text(
        '1',
      ),
    ),
    Container(
      color: Colors.green,
      alignment: Alignment.center,
      width: 100,
      height: 100,
      child: const Text(
        '2',
      ),
    ),
    Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      width: 100,
      height: 50,
      child: const Text(
        '3',
      ),
    ),
  ],
)
```

![Untitled](Week%203/Untitled%2010.png)

## Padding

안쪽 여백

```dart
body: Padding(
  padding: const EdgeInsets.all(100.0),
  child: Container(
    color: Colors.yellow,
  ),
),
```

![Untitled](Week%203/Untitled%2011.png)

## Container 
(margin properties)

바깥 여백

```dart
body: Container(
  margin: const EdgeInsets.all(100.0),
  color: Colors.green,
),
```

![Untitled](Week%203/Untitled%2012.png)

## EdgeInsetsGeometry type

```dart
// 여백 값을 없애고 싶을 때
margin: EdgeInsets.zero,
```

```dart
// left, top, right, bottom 동일한 여백값을 주고 싶을때
margin: const EdgeInsets.all(40),
```

```dart
// left, top, right, bottom 각기 다른 값을 주고 싶을때
margin: const EdgeInsets.fromLTRB(10, 70, 80, 100),
```

```dart
// left, top, right, bottom 원하는 값만 여백을 주고 싶을때
margin: const EdgeInsets.only(bottom: 100),
margin: const EdgeInsets.only(bottom: 100, top: 20),
```

```dart
// 가로, 세로 별로 여백을 주고 싶을때
margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
```

## Align

아래 3개 코드는 다 동일 
(아래로 내려갈 수록 자율성 높다)

```dart
body: Center(
    child: Container(
      color: Colors.yellow,
      height: 200,
      width: 200,
    ),
  ),
```

```dart
body: Align(
    alignment: Alignment.center,
    child: Container(
      color: Colors.yellow,
      height: 200,
      width: 200,
    ),
  ),
```

```dart
body: Align(
    alignment: const Alignment(0, 0),
    child: Container(
      color: Colors.yellow,
      height: 200,
      width: 200,
    ),
  )
```

![Untitled](Week%203/Untitled%2013.png)

## Spacer (여백)

```dart
body: Row(
  children: [
    Container(
      color: Colors.yellow,
      height: 40,
      width: 40,
    ),
    Container(
      color: Colors.green,
      height: 40,
      width: 40,
    ),
    const Spacer(),
    Container(
      color: Colors.blue,
      height: 40,
      width: 40,
    ),
    const Spacer(),
    Container(
      color: Colors.pink,
      height: 40,
      width: 40,
    ),
    const Spacer(),
    Container(
      color: Colors.purple,
      height: 40,
      width: 40,
    ),
  ],
)
```

![Untitled](Week%203/Untitled%2014.png)

### flex properties

```dart
const Spacer(
  flex: 3,
),
```

![= flex값 / flex 총합](Week%203/Untitled%2015.png)

= flex값 / flex 총합

eg. 1+1+3 = 1/5 + 1/5 + 3/5

![Untitled](Week%203/Untitled%2016.png)

# 3. Expanded (나머지 영역 안에서 위젯을 그리고 싶을 때)

![Untitled](Week%203/Untitled%2017.png)

```dart
const Expanded(
  child: Text('ddsdfsdfsdfsddsdfsdfsdfsddsdfsdfsdfsddsdfsdfsdfs'),
),
```

![Untitled](Week%203/Untitled%2018.png)

```dart
body: Row(
        children: [
          Container(
            color: Colors.yellow,
            height: 40,
            width: 40,
          ),
          const Expanded(
						// 3 /(3+1)
            flex: 3, 
            child: Text('ddsdfsd'),
          ),
          Container(
            color: Colors.green,
            height: 40,
            width: 40,
          ),
          Container(
            color: Colors.blue,
            height: 40,
            width: 40,
          ),
          const Expanded(
						// 1 /(3+1)
            flex: 1,
            child: Text('ddsdfsd'),
          ),
        ],
      ),
```

![Untitled](Week%203/Untitled%2019.png)

## ElevatedButton, OutlinedButton, TextButton

### 생성자 형태(속성값)가 동일합니다.

![Untitled](Week%203/Untitled%2020.png)

![Untitled](Week%203/Untitled%2021.png)

```dart
body: Column(
  children: [
    ElevatedButton(
      onPressed: () {
        print('ElevatedButton');
      },
      onLongPress: () {
        print('ElevatedButton onLongPress');
      },
      child: const Text('ElevatedButton'),
    ),
    ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
      ),
      child: const Text('ElevatedButton2 blue'),
    ),
    OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        primary: Colors.blue,
      ),
      child: const Text('OutlinedButton'),
    ),
    TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.blue,
      ),
      child: const Text('TextButton'),
    ),
    GestureDetector(
      onTap: () {
        print('GestureDetector');
      },
      child: const Text('GestureDetector'),
    ),
  ],
),
```

### styleFrom

```dart
style: ElevatedButton.styleFrom(
	primary: Colors.blue,
	onPrimary: Colors.white,
),

style: OutlinedButton.styleFrom(
  primary: Colors.blue,
),

style: TextButton.styleFrom(
  primary: Colors.blue,
),

```

![Untitled](Week%203/Untitled%2022.png)

### disable

```dart
ElevatedButton(
  onPressed: null,
  style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    onPrimary: Colors.white,
    onSurface: Colors.blue,
  ),
  child: const Text('ElevatedButton2 blue'),
),
```

```dart
OutlinedButton(
  onPressed: () {},
  style: OutlinedButton.styleFrom(
    primary: Colors.blue,
    side: const BorderSide(color: Colors.blue),
  ),
  child: const Text('OutlinedButton'),
),
OutlinedButton(
  onPressed: null,
  style: OutlinedButton.styleFrom(
    primary: Colors.blue,
    onSurface: Colors.blue,
  ),
  child: const Text('OutlinedButton'),
),
```

비활성화된 컬러까지 자세히 컨트롤 하고 싶다면?

```dart
TextButton(
  onPressed: null,
  style: TextButton.styleFrom(
    primary: Colors.blue,
    onSurface: Colors.blue,
  ),
  child: const Text('TextButton'),
),
```

![Untitled](Week%203/Untitled%2023.png)

## GestureDetector

다양한 제스처를 캐치할 수 있습니다.

```dart
GestureDetector(
    onTap: () {
      print('GestureDetector');
    },
    child: Container(
      color: Colors.yellow,
      height: 100,
    ),
  ),
```
