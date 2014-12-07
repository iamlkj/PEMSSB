//
//  NSObject+trainingController.m
//  PMSSB
//
//  Created by LKJ on 12/8/22.
//
//

#import "trainingController.h"

@implementation trainingController

-(id)initWithTarget:(UIView*)view
{
    self=[super init];
    startPtr=1000;
    itemNum=0;
    targetView=view;
    seg=[[segment alloc]init];
    display=NO;
    [self cleanItemView];
    return self;
}
-(void)addItemWithType:(int)type status:(int)status aid:(int)aid
{
    NSString*picName=[self pictureWithType:type status:status];
    if(display==YES)
    {
        UIImageView*tmp =[[UIImageView alloc]initWithImage:[UIImage imageNamed:picName]];
        tmp.tag=1000;
        [tmp setFrame:CGRectMake((itemNum-startPtr)*70+66, 600, 60, 60)];
        [targetView addSubview:tmp];
    }
    itemTable[itemNum][0]=aid;
    itemTable[itemNum][1]=status;
    itemNum++;
}

-(void)cleanItemView
{
    
   for(UIImageView *subview in [targetView subviews] )
    {
        if(subview.tag==1000)[subview removeFromSuperview];
    }
   /* for(int i=startPtr;i<itemNum;i++)
    {
        NSLog(@"remove!!");
        [itemview[itemNum] removeFromSuperview];
        //if(itemview[itemNum]!=Nil)[itemview[itemNum] removeFromSuperview];
        itemview[itemNum]=Nil;
    }*/
    startPtr=1000;
    startTime=Nil;
    endTime=Nil;
    name=Nil;
    //itemNum=0;
}
-(void)setName:(NSString*)n
{
    name=[[NSString alloc]initWithString:n];
}
-(void)setTime:(NSString *)time withMode:(int)mode
{
    if(mode==0)
    {
        startTime=[[NSString alloc]initWithString:time];
        startPtr=itemNum;
        display=YES;
    }
    else
    {
        endTime=[[NSString alloc]initWithString:time];
        display=NO;
    }
}
-(void)cleanHistory
{
    [self cleanItemView];
    itemNum=0;
}
-(char*)detect
{
    NSLog(@"itemnum=%d",itemNum);
    char tmp[1000];
    for(int i=0;i<1000;i++)
    {
        tmp[i]=0;
    }
    int num=0;
    for(int i=0;i<itemNum;i++)
    {
        NSLog(@"itemtable=%d",itemTable[i][0]);
        
        if(itemTable[i][0]<10)
        {
            tmp[num]='0';
            num++;
            tmp[num]=itemTable[i][0]+'0';
            num++;
            tmp[num]=itemTable[i][1]+'0';
            num++;
        }
        else
        {
            tmp[num]=itemTable[i][0]/10 +'0';
            num++;
            tmp[num]=itemTable[i][0]%10 +'0';
            num++;
            tmp[num]=itemTable[i][1]+'0';
            num++;
        }
    }
    NSString* k=[[NSString alloc] initWithCString:tmp encoding:NSASCIIStringEncoding];
    NSDate *curentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* compoNents = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:curentDate]; // Get necessary date components
    
    int mm=[compoNents month]; //gives you month
    int dd=[compoNents day]; //gives you day
    int yy=[compoNents year]; // gives you year
    int hh= [compoNents hour];
    int ss=[compoNents second];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH/mm/ss/yyyy/MM/dd|"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];

    return [seg detecting:k nowtime:strDate];

}
-(void)sendTrainingStuff
{
    char tmp[300];
    for(int i=0;i<300;i++)
    {
        tmp[i]=0;
    }
    int num=0;
    for(int i=startPtr;i<itemNum;i++)
    {
        
        if(itemTable[i][0]<10)
        {
            tmp[num]='0';
            num++;
            tmp[num]=itemTable[i][0]+'0';
            num++;
            tmp[num]=itemTable[i][1]+'0';
            num++;
        }
        else
        {
            tmp[num]=itemTable[i][0]/10 +'0';
            num++;
            tmp[num]=itemTable[i][0]%10 +'0';
            num++;
            tmp[num]=itemTable[i][1]+'0';
            num++;
        }
    }
    NSLog(@"cstring!! %s haha %d",tmp,itemTable[0][0]);
    NSString* k=[[NSString alloc] initWithCString:tmp encoding:NSASCIIStringEncoding];
    NSLog(@"nsstring!! %@",k);
    [seg trainingwithNAME:name withEVENT:k withSTARTTIME:startTime withENDTIME:endTime];
}
-(NSString *)pictureWithType:(int)type status:(int)status
{
    if(status==0)
    {
        switch (type) {
            case 0:
                return @"app_0.png";
                break;
            case 1:
                return @"app_1_d.png";
                break;
			case 2:
                return @"app_2_d.png";
                break;
			case 3:
                return @"app_3_d.png";
                break;
			case 4:
                return @"app_4_d.png";
                break;
			case 5:
                return @"app_5_d.png";
                break;
			case 8:
                return @"app_8_d.png";
                break;
			case 10:
                return @"app_10_d.png";
                break;
			case 12:
                return @"app_12_d.png";
                break;
			case 14:
                return @"app_14_d.png";
                break;
			case 18:
                return @"app_18_d.png";
                break;
			case 19:
                return @"app_19_d.png";
                break;
			case 32:
                return @"app_32_d.png";
                break;
			case 34:
                return @"app_34_d.png";
                break;
			case 35:
                return @"app_35_d.png";
                break;
			case 37:
                return @"app_37_d.png";
                break;
			case 39:
                return @"app_39_d.png";
                break;
			case 56:
                return @"app_56_d.png";
                break;
                
            default:
                return @"app_0.png";
                break;
        }
        
    }
	else if(status==1)
	{
		switch(type)
		{
		    case 0:
                return @"app_0.png";
                break;
            case 1:
                return @"app_1.png";
                break;
			case 2:
                return @"app_2.png";
                break;
			case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
            default:
                return @"app_0.png";
                break;
		}
	}
	else if(status==2)
	{
		switch(type)
		{
            case 0:
                return @"app_0.png";
		    case 1:
                return @"app_1_1.png";
                break;
			case 2:
                return @"app_2_1.png";
                break;
            case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
                
            default:
                return @"app_0.png";
                break;
		}
        
	}
	else if(status==3)
	{
		switch(type)
		{
		    case 1:
                return @"app_1_2.png";
                break;
			case 2:
                return @"app_2_2.png";
                break;
            case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
            default:
                return @"app_0.png";
                break;
		}
        
	}
	else if(status==4)
	{
		switch(type)
		{
		    case 1:
                return @"app_1_3.png";
                break;
			case 2:
                return @"app_2_3.png";
                break;
            case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
            default:
                return @"app_0.png";
                break;
		}
        
	}
    else
	{
		switch(type)
		{
		    case 1:
                return @"app_1_3.png";
                break;
			case 2:
                return @"app_2_3.png";
                break;
            case 3:
                return @"app_3.png";
                break;
			case 4:
                return @"app_4.png";
                break;
			case 5:
                return @"app_5.png";
                break;
			case 8:
                return @"app_8.png";
                break;
			case 10:
                return @"app_10.png";
                break;
			case 12:
                return @"app_12.png";
                break;
			case 14:
                return @"app_14.png";
                break;
			case 18:
                return @"app_18.png";
                break;
			case 19:
                return @"app_19.png";
                break;
			case 24:
                return @"app_19.png";
                break;
			case 32:
                return @"app_32.png";
                break;
			case 34:
                return @"app_34.png";
                break;
			case 35:
                return @"app_35.png";
                break;
			case 37:
                return @"app_37.png";
                break;
			case 39:
                return @"app_39.png";
                break;
			case 56:
                return @"app_56.png";
                break;
                
            default:
                return @"app_0.png";
                break;
		}
        
	}
}
@end
