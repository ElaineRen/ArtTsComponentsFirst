import CommonConstants from '../constants/CommonConstants'

@Entry
@Component
struct MainPage {
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(title: Resource, index: number, selectImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectImg : normalImg)
        .width($r('app.float.vp_25'))
        .height($r('app.float.vp_25'))
      Text(title)
        .margin({ top: $r('app.float.vp_4') })
        .fontSize($r('app.float.fp_10'))
        .fontColor(this.currentIndex === index ? $r('app.color.color_1698ce') : $r('app.color.color_6b6b6b'))
    }
    .justifyContent(FlexAlign.Center)
    .height($r('app.float.vp_56'))
    .width(CommonConstants.FULL_PARENT)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex)
    })
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      TabContent() {
        //todo home页面

      }
      .padding({ left: $r('app.float.vp_12'), right: $r('app.float.fp_12') })
      .backgroundColor($r('app.color.color_f1f3f5'))
      .tabBar(this.TabBuilder($r('app.string.home_tile')
        , CommonConstants.HOME_TAB_INDEX
        , $r('app.media.home_selected')
        , $r('app.media.home_normal')))

      TabContent() {
        //todo mine页面

      }.padding({ left: $r('app.float.vp_12'), right: $r('app.float.fp_12') })
      .backgroundColor($r('app.color.color_f1f3f5'))
      .tabBar(this.TabBuilder($r('app.string.my_title')
        , CommonConstants.MINE_TAB_INDEX
        , $r('app.media.mine_selected')
        , $r('app.media.mine_normal')))
    }
    .width(CommonConstants.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight($r('app.float.vp_56'))
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })

  }
}