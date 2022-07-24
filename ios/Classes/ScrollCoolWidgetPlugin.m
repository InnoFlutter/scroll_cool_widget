#import "ScrollCoolWidgetPlugin.h"
#if __has_include(<scroll_cool_widget/scroll_cool_widget-Swift.h>)
#import <scroll_cool_widget/scroll_cool_widget-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "scroll_cool_widget-Swift.h"
#endif

@implementation ScrollCoolWidgetPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftScrollCoolWidgetPlugin registerWithRegistrar:registrar];
}
@end
