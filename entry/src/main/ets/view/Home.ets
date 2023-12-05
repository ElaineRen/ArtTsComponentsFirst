import CommonConstants from '../constants/CommonConstants';
import mainViewModel from '../viewModel/MainViewModel';

@Preview
@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Column() {
          Text($r('app.string.home_tile'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.fp_24'))
            .margin({ top: $r('app.float.vp_12') })
            .padding({ left: $r('app.float.vp_12') })
        }.width(CommonConstants.FULL_PARENT)
        .alignItems(HorizontalAlign.Start)

        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius($r('app.float.vp_16'))
          }, (img: Resource) => JSON.stringify(img.id))


        }.margin({ top: $r('app.float.vp_24') })
        .autoPlay(true)
      }
    }
    .height(CommonConstants.FULL_PARENT)

  }
}
