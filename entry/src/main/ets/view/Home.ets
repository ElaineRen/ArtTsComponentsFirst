import CommonConstants from '../constants/CommonConstants';
import PageResource from '../viewModel/ItemData';
import mainViewModel from '../viewModel/MainViewModel';

@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        //title
        Column() {
          Text($r('app.string.home_tile'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.fp_24'))
            .margin({ top: $r('app.float.vp_12') })
            .padding({ left: $r('app.float.vp_12') })
        }.width(CommonConstants.FULL_PARENT)
        .alignItems(HorizontalAlign.Start)

        // 轮播banner
        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius($r('app.float.vp_16'))
          }, (img: Resource) => JSON.stringify(img.id))

        }.margin({ top: $r('app.float.vp_24') })
        .autoPlay(true)

        // first grid
        Grid() {
          ForEach(mainViewModel.getFirstGridData(), (img: PageResource) => {
            GridItem() {
              Column() {
                Image(img.img)
                  .width($r('app.float.vp_24'))
                  .height($r('app.float.vp_24'))
                Text(img.title)
                  .fontSize($r('app.float.fp_12'))
                  .margin({ top: $r('app.float.vp_4') })
              }
            }
          }, (itemData: PageResource) => JSON.stringify(itemData))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.vp_8'))
        .rowsGap($r('app.float.vp_12'))
        .padding({ top: $r('app.float.vp_12'), bottom: $r('app.float.vp_12') })
        .height($r('app.float.vp_124'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.vp_24'))
        // second Title
        Text($r('app.string.home_list'))
          .fontSize($r('app.float.fp_16'))
          .fontWeight(FontWeight.Medium)
          .width(CommonConstants.FULL_PARENT)
          .margin({ top: $r('app.float.vp_12') })

        //second Grid
        Grid() {
          ForEach(mainViewModel.getSecondGridData(), (secondItem: PageResource) => {
            GridItem() {
              Column() {
                Text(secondItem.title)
                  .fontSize($r('app.float.fp_16'))
                  .fontWeight(FontWeight.Medium)
                Text(secondItem.others)
                  .margin({ top: $r('app.float.vp_4') })
                  .fontSize($r('app.float.fp_12'))
                  .fontColor($r('app.color.color_99182431'))
              }
              .alignItems(HorizontalAlign.Start)
            }
            .padding({ top: $r('app.float.vp_8'), left: $r('app.float.vp_8') })
            .borderRadius($r('app.float.vp_12'))
            .align(Alignment.TopStart)
            .backgroundImage(secondItem.img)
            .backgroundImageSize(ImageSize.Cover)
            .width(CommonConstants.FULL_PARENT)
            .height(CommonConstants.FULL_PARENT)
          }, (secondItem: PageResource) => JSON.stringify(secondItem))

        }
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.vp_260'))
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.vp_8'))
        .rowsGap($r('app.float.vp_12'))
        .margin({ bottom: $r('app.float.vp_55') })
      }
    }
    .height(CommonConstants.FULL_PARENT)

  }
}
