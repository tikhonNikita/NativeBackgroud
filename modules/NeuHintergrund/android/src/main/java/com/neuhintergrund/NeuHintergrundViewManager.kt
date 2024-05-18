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
import eightbitlab.com.blurview.BlurAlgorithm
import eightbitlab.com.blurview.BlurView
import eightbitlab.com.blurview.RenderEffectBlur
import eightbitlab.com.blurview.RenderScriptBlur

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
        Log.d("NeuHintergrundViewManager", "createViewInstance")
        val blurView = BlurView(ctx)
        initializeBlurView(ctx, blurView)
        return blurView
    }

    private fun initializeBlurView(ctx: ThemedReactContext, blurView: BlurView) {
        ctx.currentActivity?.let {
            val decorView = it.window.decorView
            val root = decorView.findViewById<ViewGroup>(R.id.content)
            val algorithm = getBlurAlgorithm(ctx)
            blurView
                .setupWith(root, algorithm)
                .setBlurRadius(20f)
                .setFrameClearDrawable(decorView.background)
            blurView.outlineProvider = ViewOutlineProvider.BACKGROUND
            blurView.clipToOutline = true
        }
    }

    @ReactProp(name = "color", customType = "Color")
    override fun setColor(view: BlurView?, value: Int?) {
        if (view == null || value == null) {
            Log.e("NeuHintergrundViewManager", "setColor: View or color value is null")
            return
        }

        try {
            Log.d("NeuHintergrundViewManager", "Setting color: $value")
            view.setOverlayColor(value)
        } catch (e: IllegalArgumentException) {
            Log.e("NeuHintergrundViewManager", "Invalid color argument: $value", e)
            // Set a default color in case of an error
            view.setOverlayColor(DEFAULT_COLOR)
        } finally {
            view.invalidate()
        }
    }


    @ReactProp(name = "blurRadius")
    override fun setBlurRadius(view: BlurView, value: Float) {
        view.setBlurRadius(value)
        view.invalidate()
    }

    override fun setEnabled(view: BlurView?, value: Boolean) {
        if (view == null) {
            Log.e("NeuHintergrundViewManager", "setEnabled: View is null")
            return
        }
        view.setBlurEnabled(value)
        view.invalidate()
    }


    fun getBlurAlgorithm(ctx: ThemedReactContext): BlurAlgorithm {
        val algorithm: BlurAlgorithm = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            RenderEffectBlur()
        } else {
            RenderScriptBlur(ctx)
        }
        return algorithm
    }


    companion object {
        const val NAME = "AndroidNeuHintergrundView"
        private const val DEFAULT_COLOR = Color.TRANSPARENT
    }
}
