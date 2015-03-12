#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>

#define HEIGHT 32

int main (int argc, const char * argv[]) {
  [NSAutoreleasePool new];
  id appName = [[NSProcessInfo processInfo] processName];

  [NSApplication sharedApplication];

  // Set up a menu bar, mostly to get its height.
  id menubar = [[NSMenu new] autorelease];
  id appMenuItem = [[NSMenuItem new] autorelease];
  [menubar addItem:appMenuItem];
  [NSApp setMainMenu:menubar];
  id appMenu = [[NSMenu new] autorelease];
  id quitTitle = [@"Quit " stringByAppendingString:appName];
  id quitMenuItem = [[[NSMenuItem alloc] initWithTitle:quitTitle
    action:@selector(terminate:) keyEquivalent:@"q"] autorelease];
  [appMenu addItem:quitMenuItem];
  [appMenuItem setSubmenu:appMenu];

  [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
  NSRect screen = [[NSScreen mainScreen] frame];
  CGFloat menuBarHeight = [menubar menuBarHeight];
  NSLog(@"menu bar height: %f\n", menuBarHeight);

  id window = [[[NSWindow alloc]
    initWithContentRect:NSMakeRect(0, 0, screen.size.width, menuBarHeight)
    styleMask:NSBorderlessWindowMask
    backing:NSBackingStoreBuffered defer:YES]
      autorelease];
  NSRect frame = [window frame];
  frame.origin.x = 0;
  frame.origin.y = screen.size.height - menuBarHeight;
  frame.size.width = screen.size.width;
  frame.size.height = menuBarHeight;
  [window setFrame:frame display:YES animate:NO];
  [window setTitle:appName];
  [window setLevel:NSMainMenuWindowLevel + 1];
  [window setBackgroundColor:NSColor.blackColor];

  NSTextField *inputField = [[NSTextField alloc] initWithFrame: frame];
//  [[window contentView] addSubview:inputField];
  [window setContentView:inputField];  
  [inputField setBackgroundColor:NSColor.blueColor];
  [inputField setEditable:YES];
  [inputField setEnabled:YES];
  [inputField setStringValue:@"hello>"];

  [window makeKeyAndOrderFront:nil];
  [NSApp activateIgnoringOtherApps:YES];
  [NSApp run];
  return 0;
}