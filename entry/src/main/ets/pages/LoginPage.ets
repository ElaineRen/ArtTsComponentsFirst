import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import CommonConstants from '../constants/CommonConstants';

@Extend(Line) function lineStyle() {
  .width(CommonConstants.FULL_PARENT)
  .height($r('app.float.vp_1'))
  .backgroundColor($r('app.color.color_33182431'))
}

@Extend(Text) function blueTextStyle() {
  .fontColor($r('app.color.color_007def'))
  .fontSize($r('app.float.fp_14'))
  .fontWeight(FontWeight.Medium)
}

@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.color_99182431'))
  .height($r('app.float.vp_45'))
  .fontSize($r('app.float.fp_18'))
  .backgroundColor($r('app.color.color_f1f3f5'))
  .width(CommonConstants.FULL_PARENT)
  .padding({ left: CommonConstants.INPUT_PADDING_LEFT })
  .margin({ top: $r('app.float.vp_12') })
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
    .height($r('app.float.vp_48'))
    .width($r('app.float.vp_48'))
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
        .inputStyle()
        .onChange((value: string) => {
          this.account = value;
        })
      Line().lineStyle();

      TextInput({ placeholder: $r('app.string.password_str') })
        .maxLength(CommonConstants.INPUT_PASSWORD_LENGTH)
        .type(InputType.Password)
        .inputStyle()
        .onChange((value: string) => {
          this.password = value;
        })
      Line().lineStyle()
      Row() {
        Text($r('app.string.verification_code_login')).blueTextStyle()
        Text($r('app.string.forgot_password')).blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(CommonConstants.FULL_PARENT)
      .margin({ top: $r('app.float.vp_8') })

      Button($r('app.string.login_in'), { type: ButtonType.Capsule })
        .width(CommonConstants.BUTTON_WIDTH)
        .height($r('app.float.vp_40'))
        .fontSize($r('app.float.fp_16'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.color_007def'))
        .margin({ top: $r('app.float.logo_image_size_87vp'), bottom: $r('app.float.vp_12') })
        .onClick(() => {
          this.Login()
        })
      Text($r('app.string.register_an_account'))
        .fontColor($r('app.color.color_007def'))
        .fontSize($r('app.float.fp_16'))
        .fontWeight(FontWeight.Medium)

      if (this.isShowProgress) {
        LoadingProgress()
          .color($r('app.color.color_182431'))
          .width($r('app.float.vp_30'))
          .height($r('app.float.vp_30'))
          .margin({ top: $r('app.float.vp_20') })
      }
      Blank()
      Text($r('app.string.other_login_method'))
        .fontColor($r('app.color.color_838d97'))
        .fontSize($r('app.float.fp_12'))
        .fontWeight(FontWeight.Medium)
        .margin({ top: $r('app.float.vp_50'), bottom: $r('app.float.vp_12') })
      Row({ space: CommonConstants.LOGIN_METHODS_SPACE }) {
        this.imageButton($r("app.media.login_method1"))
        this.imageButton($r("app.media.login_method2"))
        this.imageButton($r("app.media.login_method3"))
      }

    }.backgroundColor($r('app.color.background'))
    .height(CommonConstants.FULL_PARENT)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left: $r('app.float.vp_12'),
      right: $r('app.float.vp_12'),
      bottom: $r('app.float.page_padding_24vp')
    })
  }
}