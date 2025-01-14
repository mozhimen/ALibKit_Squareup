# okhttp3
# https://github.com/square/okhttp/blob/master/okhttp/src/main/resources/META-INF/proguard/okhttp3.pro
# https://github.com/square/okio/blob/master/okio/src/jvmMain/resources/META-INF/proguard/okio.pro
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn com.squareup.okhttp3.**
-keep class com.squareup.okhttp3.** { *; }
-keep class okhttp3.internal.** { *; }

# okhttp 网络请求
-keep class com.squareup.okhttp.* { *; }
-keep interface com.squareup.okhttp.** { *; }
-dontwarn com.squareup.okhttp.**

# okhttp 3
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Okio
-dontwarn com.squareup.**
-dontwarn okio.**
-keep public class org.codehaus.* { *; }
-keep public class java.nio.* { *; }

# JSR 305 annotations are for embedding nullability information.
-dontwarn javax.annotation.**

# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

# OkHttp platform used only on JVM and when Conscrypt dependency is available.
-dontwarn okhttp3.internal.platform.ConscryptPlatform
-dontwarn org.conscrypt.ConscryptHostnameVerifier
-dontwarn org.conscrypt.**

#-------------------------------------------------------
# okhttp version >= 4.7.0
-keepclassmembers class okhttp3.internal.Util {
    public static java.lang.String userAgent;
}
# okhttp version < 4.7.0
#-keepclassmembers class okhttp3.internal.Version {
#    # 4.0.0 <= version < 4.7.0
#    public static java.lang.String userAgent;
#    # version < 4.0.0
#    public static java.lang.String userAgent();
#}
# okhttp version < 4.0.0
#-keepclassmembers class okhttp3.internal.http.StatusLine {
#    public static okhttp3.internal.http.StatusLine parse(java.lang.String);
#}
#-keepclassmembers class okhttp3.internal.cache.DiskLruCache {
#    public static okhttp3.internal.cache.DiskLruCache create(
#                  okhttp3.internal.io.FileSystem, java.io.File, int, int, long);
#}
# 4.0.0 <= okhttp version < 4.3.0
#-keepclassmembers class okhttp3.internal.cache.DiskLruCache$Companion {
#    public okhttp3.internal.cache.DiskLruCache create(
#              okhttp3.internal.io.FileSystem, java.io.File, int, int, long);
#}
# With R8 full mode generic signatures are stripped for classes that are not kept.
#-keep,allowobfuscation,allowshrinking class * extends rxhttp.wrapper.parse.TypeParser