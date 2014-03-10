//
//  UICustomSwitch.m
//  SocialShare
//
//
//  Created by Tapha Media Ltd on 03/08/13.
//  Copyright 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomSwitch.h"


@implementation UICustomSwitch

@synthesize on;
@synthesize tintColor, clippingView, leftLabel, rightLabel;

+(UICustomSwitch *)switchWithLeftText:(NSString *)leftText andRight:(NSString *)rightText
{
	UICustomSwitch *switchView = [[UICustomSwitch alloc] initWithFrame:CGRectZero];
	
	switchView.leftLabel.text = leftText;
	switchView.rightLabel.text = rightText;
	
	return switchView;
}

-(id)initWithFrame:(CGRect)rect
{
	if ((self=[super initWithFrame:CGRectMake(rect.origin.x,rect.origin.y,95,27)]))
	{
		//		self.clipsToBounds = YES;
		
		[self awakeFromNib];
	}
	return self;
}

-(void)awakeFromNib
{
	[super awakeFromNib];
	
	self.backgroundColor = [UIColor clearColor];

	[self setThumbImage:[UIImage imageNamed:@"switchThumb.png"] forState:UIControlStateNormal];
	[self setMinimumTrackImage:[UIImage imageNamed:@"switchBlueBg.png"] forState:UIControlStateNormal];
	[self setMaximumTrackImage:[UIImage imageNamed:@"switchOffPlain.png"] forState:UIControlStateNormal];
	
	self.minimumValue = 0;
	self.maximumValue = 1;
	self.continuous = NO;
	
	self.on = NO;
	self.value = 0.0;
	
	self.clippingView = [[UIView alloc] initWithFrame:CGRectMake(4,2,87,23)];
	self.clippingView.clipsToBounds = YES;
	self.clippingView.userInteractionEnabled = NO;
	self.clippingView.backgroundColor = [UIColor clearColor];
	[self addSubview:self.clippingView];
	
	NSString *leftLabelText = NSLocalizedString(@"YES","Custom UISwitch ON label. If localized to empty string then I/O will be used");
	if ([leftLabelText length] == 0)	
	{
		leftLabelText = @"l";		// use helvetica lowercase L to be a 1. 
	}
	
	self.leftLabel = [[UILabel alloc] init];
	self.leftLabel.frame = CGRectMake(0, 0, 48, 23);
	self.leftLabel.text = leftLabelText;
	self.leftLabel.textAlignment = NSTextAlignmentCenter;
	self.leftLabel.font = [UIFont boldSystemFontOfSize:17];
	self.leftLabel.textColor = [UIColor whiteColor];
	self.leftLabel.backgroundColor = [UIColor clearColor];
	[self.clippingView addSubview:self.leftLabel];
	
	
	NSString *rightLabelText = NSLocalizedString(@"NO","Custom UISwitch OFF label. If localized to empty string then I/O will be used");
	if ([rightLabelText length] == 0)	
	{
		rightLabelText = @"O";	// use helvetica uppercase o to be a 0. 
	}
	
	self.rightLabel = [[UILabel alloc] init];
	self.rightLabel.frame = CGRectMake(95, 0, 48, 23);
	self.rightLabel.text = rightLabelText;
	self.rightLabel.textAlignment = NSTextAlignmentCenter;
	self.rightLabel.font = [UIFont boldSystemFontOfSize:17];
	self.rightLabel.textColor = [UIColor grayColor];
	self.rightLabel.backgroundColor = [UIColor clearColor];
	[self.clippingView addSubview:self.rightLabel];
}

-(void)layoutSubviews
{
	[super layoutSubviews];
	
	// move the labels to the front
	[self.clippingView removeFromSuperview];
	[self addSubview:self.clippingView];
	
	CGFloat thumbWidth = self.currentThumbImage.size.width;
	CGFloat switchWidth = self.bounds.size.width;
	CGFloat labelWidth = switchWidth - thumbWidth;
	CGFloat inset = self.clippingView.frame.origin.x;
	
	NSInteger xPos = self.value * labelWidth - labelWidth - inset;
	self.leftLabel.frame = CGRectMake(xPos, 0, labelWidth, 23);
	
	xPos = switchWidth + (self.value * labelWidth - labelWidth) - inset;
	self.rightLabel.frame = CGRectMake(xPos, 0, labelWidth, 23);
}

- (void)scaleSwitch:(CGSize)newSize 
{
	self.transform = CGAffineTransformMakeScale(newSize.width,newSize.height);
}

- (UIImage *)image:(UIImage*)image tintedWithColor:(UIColor *)tint 
{	
    if (tint != nil) 
	{
		UIGraphicsBeginImageContext(image.size);

		//draw mask so the alpha is respected
		CGContextRef currentContext = UIGraphicsGetCurrentContext();
		CGImageRef maskImage = [image CGImage];
		CGContextClipToMask(currentContext, CGRectMake(0, 0, image.size.width, image.size.height), maskImage);
		CGContextDrawImage(currentContext, CGRectMake(0,0, image.size.width, image.size.height), image.CGImage);
		
		[image drawAtPoint:CGPointMake(0,0)];
		[tint setFill];
		UIRectFillUsingBlendMode(CGRectMake(0,0,image.size.width,image.size.height),kCGBlendModeColor);
		UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
        return newImage;
    }
    else 
	{
        return image;
    }
}


-(void)setTintColor:(UIColor*)color
{
	if (color != tintColor)
	{
		tintColor = color;
		
		[self setMinimumTrackImage:[self image:[UIImage imageNamed:@"switchBlueBg.png"] tintedWithColor:tintColor] forState:UIControlStateNormal];
	}
	
}

- (void)setOn:(BOOL)turnOn animated:(BOOL)animated;
{
	on = turnOn;
	
	if (animated)
	{
		[UIView	 beginAnimations:@"UICustomSwitch" context:nil];
		[UIView setAnimationDuration:0.2];
	}
	
	if (on)
	{
		self.value = 1.0;
	}
	else 
	{
		self.value = 0.0;
	}
	
	if (animated)
	{
		[UIView	commitAnimations];	
	}
}

- (void)setOn:(BOOL)turnOn
{
	[self setOn:turnOn animated:NO];
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
//	NSLog(@"preendTrackingWithtouch");
	[super endTrackingWithTouch:touch withEvent:event];
//	NSLog(@"postendTrackingWithtouch");
	m_touchedSelf = YES;
	
	[self setOn:on animated:YES];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	[super touchesBegan:touches withEvent:event];
//	NSLog(@"touchesBegan");
	m_touchedSelf = NO;
	on = !on;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
	[super touchesEnded:touches withEvent:event];
//	NSLog(@"touchesEnded");
	
	if (!m_touchedSelf)
	{
		[self setOn:on animated:YES];
		[self sendActionsForControlEvents:UIControlEventValueChanged];
	}
}

@end
