// import android.content.Context
// import android.graphics.Color
// import android.os.Build
// import android.util.AttributeSet
// import android.view.ViewGroup
// import android.widget.FrameLayout
// import com.facebook.react.uimanager.ThemedReactContext
// import com.neuhintergrund.R
// import eightbitlab.com.blurview.BlurView
// import eightbitlab.com.blurview.RenderEffectBlur
// import eightbitlab.com.blurview.RenderScriptBlur

// //TODO: Maybe it should be just a View instead of a FrameLayout as it shoud not have childern
// //TODO: Color prop is not applied correctly
// class NeuHintergrundView : FrameLayout {

//   private lateinit var blurView: BlurView

//   constructor(context: Context) : super(context) {
//     init(context)
//   }

//   constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
//     init(context)
//   }

//   constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
//     init(context)
//   }

//   private fun init(context: Context) {
//     val ctx = context as ThemedReactContext
//     ctx.currentActivity?.let {
//       it.window.decorView.rootView?.let { rootView ->
//         blurView = BlurView(context)
//         blurView.setBlurRadius(20f)
//         blurView.setOverlayColor(resources.getColor(R.color.colorOverlay, null))
//         addView(blurView)
//         if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
//           blurView.setupWith(rootView as ViewGroup, RenderEffectBlur())
//         } else {
//           blurView.setupWith(rootView as ViewGroup, RenderScriptBlur(context))
//         }
//       }
//     }

//     blurView = BlurView(context)
//     blurView.setOverlayColor(resources.getColor(R.color.colorOverlay, null))
//     addView(blurView)
//     parent?.let {
//       if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
//         blurView.setupWith(it as ViewGroup, RenderEffectBlur())
//       } else {
//         blurView.setupWith(it as ViewGroup, RenderScriptBlur(context))
//       }
//       blurView.setBlurRadius(20f)
//     }
//   }

//   fun setBlurRadius(radius: Float) {
//     blurView.setBlurRadius(radius)
//     invalidate()
//   }

//   fun setOverlayColor(color: String) {
//     blurView.setOverlayColor(Color.parseColor(color))
//     invalidate()
//   }
// }
