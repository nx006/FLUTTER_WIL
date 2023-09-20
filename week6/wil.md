# StatefulWidget
*Nomad Coder의 7강 Webtoon 앱의 경우 [webtoon](/webtoon/) 에서 확인할 수 있으며, 현재 미완인 상태입니다.*
## 개념

Flutter는 기본적으론 `StatelessWidget`을 이용하여 위젯을 그리고 UI를 구성하게 됩니다. 그러나 모든 경우에 `StatelessWidget`이 적합하지는 않습니다. 만약에 상태가 변하는 경우, UI를 실시간으로, 효과적으로 변경하기 위해서 `StatefulWidget`을 사용하게 됩니다.


한편 Flutter에서 **상태**라 함은, 데이터, 사용자의 Configuration, 혹은 앱의 구성 등을 의미합니다. 이러한 상태는 시간이 지남에 따라 변경되거나, 혹은 사용자와의 상호작용에 의해서 변경될 수 있습니다.


예를 들어 사용자가 버튼을 클릭하면, Counter가 1 증가하는 UI를 그릴 때, `StatelessWidget`을 이용할 경우, 기존에는 전체 위젯을 rebuild 하는 과정을 거쳐야 합니다.


그러나 `StatefulWidget`을 이용할 경우 효과적으로 상태를 변경하여 UI에 반영할 수 있습니다.

## 사용 예시

```dart
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget 카운터 예제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '버튼을 클릭한 횟수:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

## 언제 `StatefulWidget`을 사용하는 지

말 그대로 `State`가 변하는 모든 상황에서 사용될 수 있습니다. `StatefulWidget`은 `StatelessWidget`의 역할을 대신할 수 있지만 역으로 `StatelessWidget`이 `StatefulWidget`의 역할을 대신하지는 못합니다.


단, `StatefulWidget`은 `StatelessWidget`보다 무겁다는 단점이 있어서, 처음에는 `StatelessWidget`으로 위젯을 구성하고, 이후에 꼭 필요할 때만 `StatefulWidget`으로 만들어서 사용하는 것이 권장되는 패턴입니다.


VS Code에서는 `StatelessWidget`에서 `StatefulWidget`으로 쉽게 변경할 수 있도록 매크로를 제공하는 데, `cmd + .`을 누르고 나오는 제안 사항에서 **[StatefulWidget으로 변경]**을 누르면 됩니다.

# 상태 관리
`StatefulWidget`은 충분히 좋은 상태 관리 도구이고, `setState`로 충분히 많은 역할을 수행할 수 있지만, 선언형 UI에서 상태를 관리하는 것은 여전히 어려운 작업입니다. 특히 Flutter은 전체 위젯 트리에서 상태를 주고 받는데, 한 위젯에서 전혀 다른 위젯으로 상태를 전달할 때, 혹은 더 나아가서 전혀 별도의 페이지에 같은 상태를 전달해야 할 때 꽤 곤란한 상황을 겪으 수 있습니다.


이러한 번거로운 작업을 피하고자, Flutter 등의 선언형 UI에서는 **상태 관리** 도구를 사용합니다.

## StatefulWidget VS 상태 관리

사실 저는 `StatefulWidget` 만을 사용하면서 그렇게 불편하다는 느낌을 받지는 않았습니다. 왜냐면 애초에 상태 관리가 매우 복잡한 앱을 만들어본 적도, 그러한 상황을 가정하거나 상정해본 적도 없었기 떄문입니다.


만들어 본 프로젝트가 매우 간단한 프로젝트였다 보니, `StatefulWidget` 만으로 충분하긴 했는데, 문제는 그래도 페이지를 넘나드는 상태를 관리하는 게 까다롭긴 했습니다. 예전에는 `GetX`의 페이지 라우팅 시 인자를 같이 전달하는 방식으로 코딩했었는데, 지금 생각해보면 그리 좋은 방식은 아니라고 생각합니다.


반면에 상태 관리 도구인 GetX, Riverpod을 사용하면서, 확실히 편리하다는 생각은 했습니다. 모르고 있을 때는 필요성을 느끼지 못하다가, 막상 써보니깐 아무리 간단한 프로그램이라도 상태관리를 써보는 게 낫겠다는 생각을 했습니다.


상태를 사실상 전역에서 관리한다는 입장이라서, 처음에는 낯설었는데, 오히려 Single Point에서 관리하는 안정적인 방법이라는 것을 알게 되었습니다.


그래서 어느 정도의 러닝 커브가 있더라도, 순수하게 `StatefulWidget`만을 사용하는 것보다는, 실제 프로젝트 시에는 Riverpod 등의 상태 관리 도구를 적극적으로 도입하는 게 장기적으로 좋은 발전 방향 같습니다.