//
//  segment.m
//  hello2
//
//  Created by Apple on 12/7/31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "segment.h"
@implementation segment

@synthesize segmentLabel;
@synthesize segmentControl;
@synthesize btn1;
@synthesize btn2;
@synthesize btn3;
@synthesize btn4;
@synthesize name;
@synthesize activity;
@synthesize se;
@synthesize responseData;

int btn1_st=0;
int btn2_st=0;
int btn3_st=0;
int btn4_st=0;
int record=1;
char action[100];

-(id)init
{
    self=[super init];
    return self;
}
-(float)PLCS:(char*)action :(char*)se
{
    NSLog(@"PLCS");
    int stra;
    int strs;
    int flag=0;
    NSLog(@"shit se= %s",se);
    NSLog(@"shit action= %s",action);
    stra = strlen(action)/3;
    strs = strlen(se)/3;
    int lcs[stra+1][strs+1];
    int i,j,li,lj;
    for(i=0;i<=stra;i++)
        lcs[i][0]=0;
    for(i=0;i<=strs;i++)
        lcs[0][i]=0;
    for(i=0,li=1;li<=stra;i++,li++)
    {
        flag=0;
        for(j=0,lj=1;lj<=strs;j++,lj++)
        {
            if((action[3*i]==se[3*j]) && (action[(3*i)+1]==se[(3*j)+1])/* && (action[(3*i)+2]==se[(3*j)+2])&&flag==0*/)
            {
                //NSLog(@"yesyes");
                lcs[li][lj]=lcs[li-1][lj-1]+1;
                //flag=1;
            }
            else
            {
                if(lcs[li][lj-1]>lcs[li-1][lj])
                    lcs[li][lj]=lcs[li][lj-1];
                else
                    lcs[li][lj]=lcs[li-1][lj];
            }
            if(lj==1 && strs>=4)NSLog(@"dong %d [%d] [%d] [%d] [%d]",li-1,lcs[li-1][1],lcs[li-1][2],lcs[li-1][3],lcs[li-1][4]);
            //NSLog(@"i=%d j=%d lcs=%d",i,j,lcs[li][lj]);
        }
    }
    int lcslen=lcs[stra][strs];
    int len;
    if(stra>strs)
        len=stra;
    else
        len=strs;
    float result=(float)lcslen/len;
    NSLog(@"stra=%d strs=%d",stra,strs);
    NSLog(@"lcs=%d len=%d",lcslen,len);
    return result;
}
-(char *)detecting:(NSString *)now nowtime:(NSString *)time
{
    char * now_action=[now UTF8String];
    NSString *postH =@"192.168.1.101";
    NSString *postR =@"root";
    NSString *postP =@"brass54760!";
    NSMutableString *postString =[NSMutableString stringWithString:@"http://192.168.1.199/~apple/test321.php"];
    NSString *jsonString =[[NSString alloc] initWithFormat:@"{\"host\":\"%@\",\"root\":\"%@\",\"pass\":\"%@\"}",postH,postR,postP];
    NSLog(jsonString);
    [postString appendString:[NSString stringWithFormat:@"?data=%@",jsonString]];
    [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
    [request setHTTPMethod:@"POST"];
    //postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    NSLog(@"post string %@",postString);
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //char * chr =[str UTF8String];
    //char * haha=strtok(chr, "|");
    float max=0.0;
    char *max_name;
    char *name1;
    float count=0.0;
    int times=0;
    NSArray* tmp = [str componentsSeparatedByString:@"~"];
    NSLog(@"index %@ couny %d",tmp,[tmp count]);
    for(int i=0;i<([tmp count]-1);i++)
    {
        NSLog(@"haha = %@",[tmp objectAtIndex:i]);
        NSArray* shit =[[tmp objectAtIndex:i] componentsSeparatedByString:@","];
        NSLog(@"fuck name = %@ , value = %@",[shit objectAtIndex:0],[shit objectAtIndex:1]);
        NSLog(@"now action = %s",now_action);
        name1 =[[shit objectAtIndex:0] cStringUsingEncoding:NSASCIIStringEncoding];
        float tmp=[self PLCS:[[shit objectAtIndex:1] cStringUsingEncoding:NSASCIIStringEncoding] :now_action ];
        if(tmp>max)
        {
            max=tmp;
            max_name=name1;
        }
        count+=tmp;
        times++;
        NSLog(@"count tmp = %f",tmp);
    }
    /*for(;haha!=NULL;haha=strtok(NULL, "|"))
    {
        NSLog(@"haha= %s",haha);
        //haha=strtok(NULL, ":");
        //NSLog(@"haha0= %s",haha);
        haha=strtok(NULL, "\"");
        NSLog(@"haha1= %s",haha);
        haha=strtok(NULL, "\"");
        NSLog(@"haha2= %s",haha);
        name1=haha;
        if(name1==NULL)return NULL;
        haha=strtok(NULL, ",");
        haha=strtok(NULL, ":");
        haha=strtok(NULL, "\"");
        NSLog(@"haha3= %s",haha);
        haha=strtok(NULL, "\"");
        NSLog(@"haha4= %s",haha);
        //call function
        NSLog(@"now action = %s",now_action);
        float tmp=[self PLCS:haha :now_action ];
        if(tmp>max)
        {
            max=tmp;
            max_name=name1;
        }
        haha=strtok(NULL, ",");
        NSLog(@"count tmp = %f",tmp);        
    }*/
    
    
    NSLog(@"count max = %f , count = %f",max,count);
    NSLog(@"-----fuck-----");
    if(((times!=1)&&max/count > 0.6) || ((times==1)&& max > 0.75))
    {
        count=0.0;
        return max_name;
    }
    return NULL;
    //看print出來的值
    //NSLog(@"str=%s",chr);
    //NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
}

-(void)trainingwithNAME:(NSString *)postN withEVENT:(NSString *)postA withSTARTTIME:(NSString *)postS withENDTIME:(NSString *)postE
{
    NSMutableString *postString =[NSMutableString stringWithString:@"http://192.168.1.199/~apple/test123.php"];
    NSString *jsonString =[[NSString alloc] initWithFormat:@"{\"Name\":\"%@\",\"Action\":\"%@\",\"Start\":\"%@\",\"End\":\"%@\"}",postN,postA,postS,postE];
    NSLog(jsonString);
    [postString appendString:[NSString stringWithFormat:@"?data=%@",jsonString]];
    [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
    [request setHTTPMethod:@"POST"];
    postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    NSLog(@"post string %@",postString);
    
    //NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    NSLog(@"-----fuck-----");
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"did Response !!");
    [responseData setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"did Data");
    [responseData appendData:data];
}
-(void)connectionDidfinishing:(NSURLConnection *)connection
{
    NSLog(@"succed %d byte received",[responseData length]);
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    segmentLabel.text = responseString;
}

/*
-(IBAction)onClickbtn1{
    if(btn1_st==0)
    {
        if(record==1)strcat(action,"p1");
        else self.segmentLabel.text = @"p1";
        NSLog(@"-----------------");
        NSLog(@"%s",action);
        btn1_st=1;
        
    }
    else
    {
        if(record==1)strcat(action,"p0");
        else self.segmentLabel.text = @"p0";
        btn1_st=0;
    }

}

-(IBAction)onClickbtn2{
    if(btn2_st==0)
    {
        if(record==1)strcat(action,"f1");
        else self.segmentLabel.text = @"f1";
        btn2_st=1;
    }
    else
    {
        if(record==1)strcat(action,"f0");
        else self.segmentLabel.text = @"f0";
        btn2_st=0;
    }
}

-(IBAction)onClickbtn3{
    if(btn3_st==0)
    {
        if(record==1)strcat(action,"b1");
        else self.segmentLabel.text = @"b1";
        btn3_st=1;
    }
    else
    {
        if(record==1)strcat(action,"b0");
        else self.segmentLabel.text = @"b0";
        btn3_st=0;
    }
}

-(IBAction)onClickbtn4{
    if(btn4_st==0)
    {
        if(record==1)strcat(action,"t1");
        else self.segmentLabel.text = @"t1";
        btn4_st=1;
    }
    else
    {
        if(record==1)strcat(action,"t0");
        else self.segmentLabel.text = @"t0";
        btn4_st=0;
    }
}
*/
@end
