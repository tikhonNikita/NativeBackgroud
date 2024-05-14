package com.neuhintergrund

import android.R
import android.graphics.Color
import android.os.Build
import android.util.Log
import android.view.ViewGroup
import android.view.ViewOutlineProvider
import androidx.annotation.RequiresApi
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.AndroidNeuHintergrundViewManagerDelegate
import com.facebook.react.viewmanagers.AndroidNeuHintergrundViewManagerInterface
import eightbitlab.com.blurview.BlurView
import eightbitlab.com.blurview.RenderEffectBlur

@ReactModule(name = NeuHintergrundViewManager.NAME)
class NeuHintergrundViewManager : SimpleViewManager<BlurView>(),
  AndroidNeuHintergrundViewManagerInterface<BlurView> {
  private val mDelegate: ViewManagerDelegate<BlurView>

  init {
    mDelegate = AndroidNeuHintergrundViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<BlurView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  @RequiresApi(Build.VERSION_CODES.S)
  public override fun createViewInstance(ctx: ThemedReactContext): BlurView {
    val blurView = BlurView(ctx)
    ctx.currentActivity?.let {
      val decorView = it.window.decorView;
      val root = decorView.findViewById<ViewGroup>(R.id.content)
      blurView
        .setupWith(root, RenderEffectBlur())
      blurView.setOverlayColor(Color.parseColor("#78ffffff"))
        .setBlurRadius(20f)
      blurView.outlineProvider = ViewOutlineProvider.BACKGROUND;
      blurView.clipToOutline = true;
    }
    return blurView
  }

  @ReactProp(name = "color")
  override fun setColor(view: BlurView, color: String?) {
    Log.d("NeuHintergrundViewManager", "setColor: $color")
    view.setOverlayColor(Color.parseColor(color))
    view.invalidate()
  }

  @ReactProp(name = "blurRadius")
  override fun setBlurRadius(view: BlurView, value: Float) {
    view.setBlurRadius(value)
    view.invalidate()
  }

  companion object {
    const val NAME = "AndroidNeuHintergrundView"
  }
}
