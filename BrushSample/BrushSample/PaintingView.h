
#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

#import <CoreGraphics/CoreGraphics.h>

//CONSTANTS:

//透明度
#define kBrushOpacity		(0.2 / 3.0)
#define kBrushPixelStep		1
//線の太さ　5:細い 1:太い
#define kBrushScale_2		2
#define kBrushScale_3		3
#define kBrushScale_4		4
#define kBrushScale_5		5
#define kBrushScale_8		8
#define kBrushScale_13		13

//#define kLuminosity			0.75
//#define kSaturation			1.0

//CLASS INTERFACES:

@interface PaintingView : UIView
{
@private
	// The pixel dimensions of the backbuffer
	GLint backingWidth;
	GLint backingHeight;
	
	EAGLContext *context;
	
	// OpenGL names for the renderbuffer and framebuffers used to render to this view
	GLuint viewRenderbuffer, viewFramebuffer;
	
	// OpenGL name for the depth buffer that is attached to viewFramebuffer, if it exists (0 if it does not exist)
	GLuint depthRenderbuffer;
	
	GLuint	brushTexture;
	CGPoint	location;
	CGPoint	previousLocation;
	Boolean	firstTouch;
	Boolean needsErase;	
	size_t			width, height;
    
    BOOL enabled;
}

@property(nonatomic, readwrite) CGPoint location;
@property(nonatomic, readwrite) CGPoint previousLocation;

- (void)erase;
-(id)eraser:(int)brush :(float)scale;
-(void)setBrushColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue opacity:(CGFloat)opacity;
-(void)changePen:(int)brush :(float)scale;
-(void)initBrush:(int)brushNo;
-(void)enabled:(BOOL)value;
- (UIImage *)getImage;
-(void)setImage:(UIImage*)aImage;

@end
