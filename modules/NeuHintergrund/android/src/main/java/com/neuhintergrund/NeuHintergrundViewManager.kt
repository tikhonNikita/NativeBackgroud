package com.neuhintergrund

import NeuHintergrundView
import android.util.Log
import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewGroupManager
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.NeuHintergrundViewManagerInterface
import com.facebook.react.viewmanagers.NeuHintergrundViewManagerDelegate

@ReactModule(name = NeuHintergrundViewManager.NAME)
class NeuHintergrundViewManager : ViewGroupManager<NeuHintergrundView>(),
  NeuHintergrundViewManagerInterface<NeuHintergrundView> {
  private val mDelegate: ViewManagerDelegate<NeuHintergrundView>

  init {
    mDelegate = NeuHintergrundViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<NeuHintergrundView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): NeuHintergrundView {
    return NeuHintergrundView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: NeuHintergrundView?, color: String?) {
//    view?.setBackgroundColor(Color.parseColor(color))
  }

  @ReactProp(name = "setBlurType")
  override fun setBlurType(view: NeuHintergrundView?, blurType: String?) {
    Log.d("MainApplication", "New Architecture is enabled")
  }

  companion object {
    const val NAME = "NeuHintergrundView"
  }
}
