package com.mozhimen.libk.squareup.okhttp3.logging.interceptor

import okhttp3.HttpUrl
import okhttp3.Interceptor
import okhttp3.Request
import okhttp3.Response

/**
 * @ClassName HostSelectionInterceptor
 * @Description TODO
 * @Author Mozhimen & Kolin Zhao
 * @Date 2024/7/3
 * @Version 1.0
 */
abstract class BaseHostSelectionInterceptor : Interceptor{
    protected open var _httpUrl: HttpUrl? = null//HttpUrl.parse(BuildConfig.DEVELOPMENT_BASE_URL);

    override fun intercept(chain: Interceptor.Chain): Response {
        var request: Request = chain.request()
        if (_httpUrl != null) {
            try {
                val newUrl: HttpUrl = request.url.newBuilder()
                    .scheme(_httpUrl!!.scheme)
                    .host(_httpUrl!!.toUrl().toURI().host)
                    .build();
                request = request.newBuilder().url(newUrl).build();
            } catch (_: Exception) {
            }
        }
        return chain.proceed(request)
    }
}