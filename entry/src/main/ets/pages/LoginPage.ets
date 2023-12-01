import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import CommonConstants from '../constants/CommonConstants';

@Extend(Line) function lineStyle() {
  .width(CommonConstants.FULL_PARENT)
  .height($r('app.float.fp_1'))
  .backgroundColor($r('app.color.color_33182431'))
}

@Extend(Text)
function blueTextStyle() {


}

@Entry
@Component
struct LoginPage {
  @State account: string = ''; //装饰的变量是组件内的状态数据，当状态数据被修改时，会自动进行ui刷新
  @State password: string = '';
  @State isShowProgress: boolean = false;
  private timeOutId: number = -1;

  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }

  Login(): void {
    if (this.account === '' || this.password === '') {
      promptAction.showToast(
        { message: $r('app.string.input_empty_tips')
        })
    } else {
      this.isShowProgress = true;
      if (this.timeOutId === -1) {
        this.timeOutId = setTimeout(() => {
          this.isShowProgress = false;
          this.timeOutId = -1;
          router.replaceUrl({ url: 'pages/MainPage' });
        }, CommonConstants.LOGIN_DELAY_TIME)
      }
    }
  }

  aboutToDisappear() {
    clearTimeout(this.timeOutId);
    this.timeOutId = -1;
  }

  build() {

    Column() {
      Image($r('app.media.logo'))
        .width($r('app.float.logo_image_size_78vp'))
        .height($r('app.float.logo_image_size_78vp'))
        .margin({ top: $r('app.float.vp_100'), bottom: $r('app.float.vp_8') })
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.fp_24'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.color_182431'))
      Text($r('app.string.login_page_content'))
        .fontSize($r('app.float.fp_16'))
        .fontColor($r('app.color.color_99182431'))
        .margin({ bottom: $r('app.float.fp_30'), top: $r('app.float.vp_8') })

      TextInput({ placeholder: $r('app.string.account_str') })
        .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
        .type(InputType.Number)
        .onChange((value: string) => {
          this.account = value;
        })
      Line().lineStyle();


    }.backgroundColor($r('app.color.background'))
    .height(CommonConstants.FULL_PARENT)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left: $r('app.float.page_padding_12vp'),
      right: $r('app.float.page_padding_12vp'),
      bottom: $r('app.float.page_padding_24vp')
    })
  }
}