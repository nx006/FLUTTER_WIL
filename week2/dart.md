# OOP

Dart 언어의 OOP는 굉장히 현대적입니다. 먼저 Dart OOP 키워드를 알아보겠습니다.

[Class modifiers](https://dart.dev/language/class-modifiers)

위 링크에서 Class Modifier를 확인할 수 있습니다.

Dart 3를 기준으로, Class Modifier는 다음이 있습니다.

- abstract
- base
- final
- interface
- sealed
- mixin

| Declaration | Contruct? | Extend? | Implement? | Mix in? | Exhaustive |
| --- | --- | --- | --- | --- | --- |
| class | O | O | O | X | X |
| base class | O | O | X | X | X |
| interface class | O | X | O | X | X |
| final class | O | X | X | X | X |
| sealed class | X | X | X | X | O |
| abstract class | X | O | O | X | X |
| abstract base class | X | O | X | X | X |
| abstract interface class | X | X | O | X | X |
| abstract final class | X | X | X | X | X |
| mixin class | O | O | O | O | X |
| base mixin class | O | O | X | O | X |
| abstract mixin class | X | O | O | O | X |
| abstract base mixin class | X | O | X | O | X |
| mixin | X | X | O | O | X |
| base mixin | X | X | X | O | X |

각각의 조합에 대해서 클래스가 갖는 특징을 정리한 장표입니다.

참고로 base, final, interface, sealed는 Dart 3에 추가된 기능으로, 그 이전 버전 다트 코드를 사용하는 경우 네 가지 키워드를 사용하면 안 됩니다. 대신 기존에 있던 modifier로, 흉내를 내는 건 가능합니다.

예를 들어서 인터페이스의 경우 Dart 2 버전에서도 abstract 클래스로 인터페이스를 동일하게 흉내낼 수 있었습니다.

그렇기 때문에 어떠한 키워드를 도입해야 할 지는 팀끼리 논의를 통해서 정해야 합니다. 위 클래스 수정자들은 개발자들이 클래스 설계를 할 때 더 다양한 옵션들을 갖고서 설계를 도와주는 역할을 제공할 뿐, 반드시 modifier를 적용할 필요는 없습니다. 오히려 해당 modifier들이 설계를 더 복잡하게 만든다면, 굳이 사용할 이유는 없습니다.

## 상속

Dart는 기본적으로 mixin 클래스를 제외하곤 이중 상속을 지원하지 않습니다. 이중 상속은 다이아몬드 상속 문제를 일으킬 수 있어, 기본적으로 많은 현대 언어들이 금지하고 있는 상속 기법입니다 (C++가 이중 상속을 지원해서 많은 문제가 발생했고, clang-tidy 등 많은 정적 분석 도구에서 이중 상속을 시도하는 순간 경고를 날립니다. 이곳에서 교훈을 얻은 Java는 이중 상속을 기본적으로 지원하지 않습니다.)

Dart에서 상속은 `extends`, `implements`, `with`로 구현됩니다.

### extends

말 그대로 일반적인 상속입니다. super 클래스에서 정의된 메소드들과 더불어서 별도의 기능을 추가하고 싶을 때 사용합니다.

### implements

인터페이스 등에서 사용합니다. super 클래스에서 정의되지 않은 생성자, 메소드의 구현이 필수적입니다.

주로, `abstract` 클래스에서 많이 사용합니다.

### with

다이아몬드 상속 문제를 피하면서 이중 상속을 사용하기 위해서, OOP는 mixin이라는 기법을 도입하게 되었습니다. 주로 인터페이스와 함께 사용하면서, 복합적인 클래스의 메소드 재사용을 목적으로 사용합니다.

```dart
mixin IRunner {
}

mixin IJumper {
}

mixin IShooter {
}

```

```dart
class Player {
}

class BaseballPlayer extends Player {
}

class BasketballPlayer extends Player {
}
```

```dart
class Pitcher extends BaseballPlayer with IRunner, IJumper {
}

class Striker extends BaseballPlayer with IShooter {
}

class 농구선수센터 extends BasketballPlayeer with IShooter, IJumper, IRunner {
}
```

이처럼 Mixin은 일부 속성만을 가져오고 싶을 때 주로 사용합니다.

```dart
class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(tabListener);
  }
```

mixin을 볼 수 있는 대표적인 클래스가 바로 tab 컨트롤러를 구현할 때입니다. 여기에서 `SingleTickerProviderStateMixin`을 확인해보면

```dart
/// Provides a single [Ticker] that is configured to only tick while the current
/// tree is enabled, as defined by [TickerMode].
///
/// To create the [AnimationController] in a [State] that only uses a single
/// [AnimationController], mix in this class, then pass `vsync: this`
/// to the animation controller constructor.
///
/// This mixin only supports vending a single ticker. If you might have multiple
/// [AnimationController] objects over the lifetime of the [State], use a full
/// [TickerProviderStateMixin] instead.
@optionalTypeArgs
mixin SingleTickerProviderStateMixin<T extends StatefulWidget> on State<T> implements TickerProvider {
  Ticker? _ticker;

  @override
  Ticker createTicker(TickerCallback onTick) {
    assert(() {
      if (_ticker == null) {
        return true;
      }
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('$runtimeType is a SingleTickerProviderStateMixin but multiple tickers were created.'),
        ErrorDescription('A SingleTickerProviderStateMixin can only be used as a TickerProvider once.'),
        ErrorHint(
          'If a State is used for multiple AnimationController objects, or if it is passed to other '
          'objects and those objects might use it more than one time in total, then instead of '
          'mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.',
        ),
      ]);
    }());
    _ticker = Ticker(onTick, debugLabel: kDebugMode ? 'created by ${describeIdentity(this)}' : null);
    _updateTickerModeNotifier();
    _updateTicker(); // Sets _ticker.mute correctly.
    return _ticker!;
  }
//...
```

이런 식으로 구현이 되어 있습니다.

# 기타 다트 문법

## 캐스케이딩

Dart에서 `..` 연산(Cascade)은, 객체를 선언함과 동시에 해당 객체 내부 메소드를 사용하기 위해서 사용됩니다. 이 과정에서 해당 메소드나 변수가 반환하는 값은 무시됩니다.

```dart
var myList = List<String>.empty(growable: true);
myList.add('apple');
myList.add('banana');
myList.add('cherry');
```

원래 위와 같이 작성해야 하는 용례를 Cascading을 쓰면 아래와 같이 작성할 수 있답니다.

```dart
var myList = List<String>.empty(growable: true)
  ..add('apple')
  ..add('banana')
  ..add('cherry');
```

원래 `add`는 void를 반환하지만, Cascading을 통해서 반환값을 무시하고 원래 객체에 접근할 수 있습니다.

그러나 Cascading 용법은 주의해서 사용되어야 한다고 합니다. 왜냐하면 다른 사람이 보기에 직관적이지 않아서, 자칫 가독성을 떨어뜨릴 수 있기 때문입니다.

## 스프레딩(Spreading)

다트에서 `...` (Spread) 연산은 리스트 등 Iterable 객체에 값을 쉽게 추가할 수 있게 도와줍니다.

```dart
List<int> list1= [1, 2, 3];
List<dynamic> list2 = [1, 2, list1]; // [1, 2, [1, 2, 3]] 이렇게 되어 있음
List<int> list3 = [1, 2, ...list1]; // [1, 2, 3, 4, 5] 이렇게 되어 있음
```

list2의 경우 스프레딩 연산자를 사용하지 않는다면, `List<int | List<int>>` 형태의 리스트로 들어갑니다.

그러나 list3의 경우 스프레딩 연산자를 사용해서, 안쪽에 있는 값들을 해체하여 사용했기 때문에 원하는 결과를 얻을 수 있습니다.

# Dart 3.0 신문법

## Destructuring

```dart
final (name, section, track) = speakerInfo(io23SeoulSpeaker);
```

Dart 3.0 부터 Destructuring을 지원하여서, 위와 같이 변수를 각각 따로 담을 수 있습니다.

## Record

Python의 Tuple과 용법과 용례가 거의 비슷합니다.

```dart
List<(String, int)> getStudentInfo() {
	return [
		('홍길동', 20),
		('이준선', 21),
		('김갑수', 24),
	];
}
```

## switch case의 변화

원래 switch에서 case를 반드시 넣어주어야 하는데, 이를 `=>`로 대신 사용할 수도 있습니다.

```dart
String? func(dynamic val, bool condition) => switch(val) {
    5 when condition => 'val is 5 when condition',
    'button' => 'val is button',
    _ => null, // defaul로는 null 반환
};
```

조금 억지 예시이긴 하지만, 위와 같이 사용할 수 있습니다.