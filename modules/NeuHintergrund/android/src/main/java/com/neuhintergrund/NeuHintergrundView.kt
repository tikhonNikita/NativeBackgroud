import android.content.Context
import android.graphics.Color
import android.os.Build
import android.util.AttributeSet
import android.widget.FrameLayout
import com.neuhintergrund.R
import eightbitlab.com.blurview.BlurView
import eightbitlab.com.blurview.RenderEffectBlur
import eightbitlab.com.blurview.RenderScriptBlur

class NeuHintergrundView : FrameLayout {

  private lateinit var blurView: BlurView
  private lateinit var contentContainer: FrameLayout

  constructor(context: Context) : super(context) {
    init(context)
  }

  constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
    init(context)
  }

  constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
    init(context)
  }

  private fun init(context: Context) {
    blurView = BlurView(context)
    blurView.setOverlayColor(resources.getColor(R.color.colorOverlay, null))
    contentContainer = FrameLayout(context)
    contentContainer.layoutParams = LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT)
    addView(blurView)
    blurView.addView(contentContainer)

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
      blurView.setupWith(contentContainer, RenderEffectBlur())
    } else {
      blurView.setupWith(contentContainer, RenderScriptBlur(context))
    }
    blurView.setBlurRadius(20f)
  }

  fun setBlurRadius(radius: Float) {
    blurView.setBlurRadius(radius)
  }

  fun setOverlayColor(color: String) {
    // Convert color String to Color Int and set as the overlay color
    val colorInt = Color.parseColor(color)
    blurView.setOverlayColor(colorInt)
  }
}
