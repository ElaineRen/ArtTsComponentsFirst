import CommonConstants from '../constants/CommonConstants';
import PageResource from '../viewModel/ItemData';
import MainViewModel from '../viewModel/MainViewModel';

@Component
export default struct Setting {
  @Builder
  settingCell(item: PageResource) {
    Row() {
      Row({ space: CommonConstants.COMMON_SPACE }) {
        Image(item.img)
          .width($r('app.float.vp_22'))
          .height($r('app.float.vp_22'))
        Text(item.title)
          .fontSize($r('app.float.fp_16'))
      }

      if (item.others === null) {
        Image($r('app.media.right_grey'))
          .width($r('app.float.vp_12'))
          .height($r('app.float.vp_24'))
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.FULL_PARENT)
    .padding({ top: $r('app.float.vp_8'), right: $r('app.float.vp_22') })
  }

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Column() {
          Text($r('app.string.mainPage_tabTitles_mine'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.fp_24'))
            .margin({ top: $r('app.float.vp_12') })
            .padding({ left: $r('app.float.vp_12') })
        }
        .width(CommonConstants.FULL_PARENT)
        .alignItems(HorizontalAlign.Start);

        Row() {
          Image($r('app.media.account'))
            .width($r('app.float.vp_48'))
            .width($r('app.float.vp_48'))
          Column() {
            Text($r('app.string.setting_account_name'))
              .fontSize($r('app.float.fp_20'))
            Text($r('app.string.setting_account_email'))
              .fontSize($r('app.float.fp_12'))
              .margin({ top: $r('app.float.vp_4') })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: $r('app.float.vp_24') })
        }
        .margin({ top: $r('app.float.vp_24') })
        .alignItems(VerticalAlign.Center)
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.vp_96'))
        .backgroundColor(Color.White)
        .padding({ left: $r('app.float.vp_24') })
        .borderRadius($r('app.float.vp_16'))

        List() {
          ForEach(MainViewModel.getSettingListData(), (itemData: PageResource) => {
            ListItem() {
              this.settingCell(itemData)
            }
            .height($r('app.float.vp_48'))
          }, (item: PageResource) => JSON.stringify(item))
        }
        .backgroundColor(Color.White)
        .width(CommonConstants.FULL_PARENT)
        .height(CommonConstants.SET_LIST_WIDTH)
        .divider({
          strokeWidth: $r('app.float.vp_0_25'),
          color: Color.Gray,
          startMargin: $r('app.float.vp_42'),
          endMargin: $r('app.float.vp_24')
        })
        .borderRadius($r('app.float.vp_16'))
        .padding({ top: $r('app.float.vp_4'), bottom: $r('app.float.vp_4') })

        Blank()

        Button($r('app.string.setting_button'), { type: ButtonType.Capsule })

          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.vp_40'))
          .fontSize($r('app.float.fp_16'))
          .fontColor($r('app.color.color_fa2a2d'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.color_e5e8ea'))
          .margin({ bottom: $r('app.float.vp_55') })

      }
      .height(CommonConstants.FULL_PARENT)
    }

  }
}