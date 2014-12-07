 //
//  scc.m
//  test_connection
//
//  Created by 建議 裡 on 12/4/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "scc.h"
#import "SBJson.h"

@implementation scc

///////////////////////////////////////////////////////////////////////////////////////////////////
-(NSString*)logintest
{
    NSString*account=@"ipad2";
    NSString* pwd=@"pwd";
    NSString *postStr =@"{\"Account\":\"";
    NSMutableData *testdata=[NSMutableData data];
    [testdata appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[account dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postStr1=@"\",\"Pwd\":\"";
    [testdata appendData:[postStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[pwd dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postStr2=@"\"}";
    [testdata appendData:[postStr2 dataUsingEncoding:NSUTF8StringEncoding]];
    //NSLog(@"testdata: %@",testdata);
    NSString *durl= @"http://140.113.166.122:8080/Login";
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *json = [parser objectWithString:ret error:nil];
    NSString *result=[json objectForKey:@"SessionID"];
    //NSLog(@"Test : %@",ret);
    //NSLog(@"SessionID : %@",result);
    
    
    return result;
}
//用不到??
///////////////////////////////////////////////////////////////////////////////////////////////////

-(NSString*)loginresult:(NSString*)ret
{
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *json = [parser objectWithString:ret error:nil];
    NSString *result=[json objectForKey:@"SessionID"];
    NSLog(@"Result: %@  ,ret=%@", result,ret);
    return result;
}

-(NSString*)login:(NSString *)account :(NSString*)pwd :(NSString*)IP
{
    NSString *postStr =@"{\"Account\":\"";
    NSMutableData *testdata=[NSMutableData data];
    [testdata appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[account dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postStr1=@"\",\"Pwd\":\"";
    [testdata appendData:[postStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[pwd dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postStr2=@"\"}";
    [testdata appendData:[postStr2 dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"testdata: %@",testdata);
    
    //NSString *durl= @"http://140.113.166.122:8080/Login";
    NSString * durl=[IP stringByAppendingString:@"/Login"];
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    NSLog(@"login:%@",ret);
    
    return [self loginresult:ret];
}


-(NSMutableArray*)DeviceConsume:(NSString*)sessionID :(int)AID :(NSString*)IP
{
    //sessionID=[self logintest:@"" :@""];
    //AID=1;
    
    NSDateFormatter *datetemp=[[NSDateFormatter alloc] init];
    [datetemp setDateFormat:@"yyyy:M:d:H:m:s"];
    NSDateFormatter *datetemp1=[[NSDateFormatter alloc] init];
    [datetemp1 setDateFormat:@"yyyy:M:d:H:m:s"];
    //
    /*NSDateComponents *test1=[[NSDateComponents alloc]init];
     [test1 setYear:2012];
     [test1 setMonth:4];
     [test1 setDay:18];
     [test1 setHour:16];
     [test1 setMinute:50];
     [test1 setSecond:0];
     NSCalendar *caltest1=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
     NSDate *test=[caltest1 dateFromComponents:test1];
     NSDateComponents *test2=[[NSDateComponents alloc]init];
     [test2 setMinute:0]; 
     NSCalendar *caltest2=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];*/
    //
    
    NSDate *time=[NSDate date];
    NSDateComponents *offset=[[NSDateComponents alloc]init];
    
    
    int interval=0;
    NSMutableArray *result=[[NSMutableArray alloc] init];
    for(int resultin=0;resultin<8;resultin=resultin+1)
    {
        /*NSDate *testtime1=[caltest1 dateByAddingComponents:test2 toDate:test options:0];
         interval=interval-5;
         [test2 setMinute:interval];
         NSDate *testtime2=[caltest2 dateByAddingComponents:test2 toDate:test options:0];
         NSString *prestring=[datetemp stringFromDate:testtime2];
         NSString *nowstring=[datetemp stringFromDate:testtime1];*/    
        
        
        NSCalendar *cal=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *now=[cal dateByAddingComponents:offset toDate:time options:0];
        interval=interval-15;
        [offset setSecond:interval]; 
        NSDate *pretime=[cal dateByAddingComponents:offset toDate:time options:0];
        NSString *prestring=[datetemp stringFromDate:pretime];
        NSString *nowstring=[datetemp stringFromDate:now];
        
        NSString *AIDnum=[NSString stringWithFormat:@"%d",AID];
        
        
        NSString *postStr =@"{\"SessionID\":\"";
        NSString *poStr1=@"\",\"From\":\"";
        NSString *poStr2=@"\",\"To\":\"";
        NSString *poStr3=@"\",\"ApplianceID\":";
        NSString *poStr4=@"}";
        NSMutableData *testdata=[NSMutableData data];
        [testdata appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[poStr1 dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[prestring dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[poStr2 dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[nowstring dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[poStr3 dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[AIDnum dataUsingEncoding:NSUTF8StringEncoding]];
        [testdata appendData:[poStr4 dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        
        
        
        NSLog(@"time: %@ /////%@",nowstring,prestring);
        //NSString *durl= @"http://140.113.166.122:8080/ApplianceQuery";
        NSString * durl=[IP stringByAppendingString:@"/ApplianceQuery"];
        
        NSURL *url = [NSURL URLWithString:durl];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:testdata];
        
        NSURLResponse *response;
        NSError *error;
        NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
        
        //NSLog(@"AIDDataquery Ret: %@",ret);
        
        NSArray *datasplit=[ret componentsSeparatedByString:@"\""] ;
        int index;
        float resul=0.0;
        //NSLog(@"%@",[locationsplit objectAtIndex:7]);
        //NSLog(@"%f",[[[datasplit objectAtIndex:8]substringFromIndex:1] floatValue]);
        for(index=6;index<[datasplit count]-1;index=index+1)
        {    
            //NSLog(@"float=%f",[[[datasplit objectAtIndex:index+1]substringFromIndex:1] floatValue]);
            
            
            if([[datasplit objectAtIndex:index] isEqualToString:@"Value"])
                resul=resul+[[[datasplit objectAtIndex:index+1]substringFromIndex:1] floatValue];
            //NSLog(@"AID=%d,X=%d,Y=%d",tmpAID,tmpx,tmpy);
            
        }
        [result addObject:[NSString stringWithFormat:@"%f",resul]];
        NSLog(@"total=%f",resul);
        NSLog(@"check=%f",[[result objectAtIndex:resultin] floatValue]);
    }  
    
    return result;
}

-(NSMutableDictionary*)scanRelation:(NSString*)sessionID :(NSString*)IP
{
    //test用
    /*sessionID=[self logintest:@"ipad2" :@"pwd"];*/
    
    NSString *postStr =@"{\"Method\":\"list\",\"SessionID\":\"";
    NSString *poStr1=@"\"}";
    NSMutableData *testdata=[NSMutableData data];
    [testdata appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[poStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    //NSLog(@"testdata: %@",testdata);
    //NSString *durl= @"http://140.113.166.122:8080/RelationConfig";
    NSString * durl=[IP stringByAppendingString:@"/RelationConfig"];
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    
    
    NSArray *relationsplit=[ret componentsSeparatedByString:@"\""] ;
    NSMutableDictionary *result=[[NSMutableDictionary alloc]init];
    //NSLog(@"%@",[relationsplit objectAtIndex:12]);
    int index;
    //[[[relationsplit objectAtIndex:index+2]substringFromIndex:1]intValue];
    for (index=6; index<[relationsplit count]-1; index=index+6)
    {
        int AIDtmp=[[[relationsplit objectAtIndex:index+2]substringFromIndex:1]intValue];
        int RIDtmp=[[[relationsplit objectAtIndex:index+4]substringFromIndex:1]intValue];
        int SIDtmp=[[[relationsplit objectAtIndex:index+6]substringFromIndex:1]intValue];
        
        
        //NSLog(@"AID=%d,RID=%d,SID=%d",AIDtmp,RIDtmp,SIDtmp);
        
        
        int mixtmp=SIDtmp+RIDtmp*10000;
        NSString *mix=[NSString stringWithFormat:@"%d",mixtmp];
        NSString *AID=[NSString stringWithFormat:@"%d",AIDtmp];
        
        [result setObject:mix forKey:AID];
    }
    
    NSLog(@"Relationlist ret: %@",ret);
    return result;
}


-(NSMutableArray*)scanItem:(NSString*)sessionID :(NSString*)IP
{
    //test用
    //sessionID=[self logintest:@"ipad2" :@"pwd"];
    
    
    NSString *postStr =@"{\"Method\":\"list\",\"SessionID\":\"";
    NSString *poStr1=@"\"}";
    NSMutableData *testdata=[NSMutableData data];
    [testdata appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[poStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    //NSLog(@"testdata: %@",testdata);
    //NSString *durl= @"http://140.113.166.122:8080/ApplianceConfig";
    NSString * durl=[IP stringByAppendingString:@"/ApplianceConfig"];
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    NSLog(@"scanItem Ret:%@",ret);
    
    
    NSArray *AIDsplit=[ret componentsSeparatedByString:@"\""];
    NSMutableArray *result=[[NSMutableArray alloc]init];
    NSMutableDictionary *relation=[self scanRelation:sessionID :IP];
    NSLog(@"%@",[AIDsplit objectAtIndex:40]);
    NSLog(@"%d",[AIDsplit count]);
    int index;
    int statmp;
    int AIDtmp;
    int Typetmp;
    for (index=6; index<[AIDsplit count]-1; index=index+1) 
    {
        
        NSMutableDictionary *content=[[NSMutableDictionary alloc] init];
        if([[AIDsplit objectAtIndex:index]isEqualToString:@"Status"])
            statmp=[[[AIDsplit objectAtIndex:index+1]substringFromIndex:1] intValue];
        if([[AIDsplit objectAtIndex:index]isEqualToString:@"ApplianceID"])
            AIDtmp=[[[AIDsplit objectAtIndex:index+1]substringFromIndex:1] intValue];
        if([[AIDsplit objectAtIndex:index]isEqualToString:@"Type"])
        {
            Typetmp=[[[AIDsplit objectAtIndex:index+1]substringFromIndex:1] intValue];
            NSString *sta=[NSString stringWithFormat:@"%d",statmp];
            NSString *AID=[NSString stringWithFormat:@"%d",AIDtmp];
            NSString *Type=[NSString stringWithFormat:@"%d",Typetmp];
            int mix=[[relation objectForKey:AID] intValue];
            NSString *SID=[NSString stringWithFormat:@"%d",(mix%10000)];
            NSString *RID=[NSString stringWithFormat:@"%d",(mix/10000)];
            [content setObject:sta forKey:@"Status"];
            [content setObject:AID forKey:@"AID"];
            [content setObject:Type forKey:@"Type"];
            [content setObject:SID forKey:@"SID"];
            [content setObject:RID forKey:@"RID"];
            //NSLog(@"%@",[content objectForKey:@"RID"]);
            [result addObject:content];
            
            NSLog(@"sta=%d,AID=%d,Type=%d,index=%d",statmp,AIDtmp,Typetmp,index);
            statmp=0;
            AIDtmp=0;
            Typetmp=0;
        }
        
        
    }
    
    return result;
}

-(float)AIDused:(NSString*)sessionID :(NSString *)IP
{
    //sessionID=[self logintest:@"" :@""];
    
    NSDateFormatter *datetemp=[[NSDateFormatter alloc] init];
    [datetemp setDateFormat:@"yyyy:M:d:H:m:s"];
    NSDateFormatter *datetemp1=[[NSDateFormatter alloc] init];
    [datetemp1 setDateFormat:@"yyyy:M:d:H:m:s"];
    
    /*NSDateComponents *test1=[[NSDateComponents alloc]init];
     [test1 setYear:2012];
     [test1 setMonth:4];
     [test1 setDay:18];
     [test1 setHour:15];
     [test1 setMinute:0];
     [test1 setSecond:0];
     NSCalendar *caltest1=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
     NSDate *testtime1=[caltest1 dateFromComponents:test1];
     NSDateComponents *test2=[[NSDateComponents alloc]init];
     [test2 setYear:2012];
     [test2 setMonth:4];
     [test2 setDay:18];
     [test2 setHour:17];
     [test2 setMinute:0];
     [test2 setSecond:0];
     NSCalendar *caltest2=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
     NSDate *testtime2=[caltest2 dateFromComponents:test2];
     NSString *prestring=[datetemp stringFromDate:testtime1];
     NSString *nowstring=[datetemp stringFromDate:testtime2];    */
    
    NSDate *now=[NSDate date];
    NSCalendar *cal=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offset=[[NSDateComponents alloc]init];
    [offset setSecond:-20];
    NSDate *pretime=[cal dateByAddingComponents:offset toDate:now options:0];
    NSString *prestring=[datetemp stringFromDate:pretime];
    NSString *nowstring=[datetemp stringFromDate:now];
    
    NSString *postStr =@"{\"SessionID\":\"";
    NSString *poStr1=@"\",\"From\":\"";
    NSString *posStr2=@"\",\"To\":\"";
    NSString *posStr3=@"\",\"ApplianceID\":0}";
    NSMutableData *testdata=[NSMutableData data];
    [testdata appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[poStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[prestring dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[posStr2 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[nowstring dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[posStr3 dataUsingEncoding:NSUTF8StringEncoding]];
    
    //NSLog(@"test: %@",nowstring);
    //NSString *durl= @"http://140.113.166.122:8080/ApplianceQuery";
    NSString * durl=[IP stringByAppendingString:@"/ApplianceQuery"];
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    NSLog(@"AIDDataquery Ret: %@",ret);
    
    NSArray *datasplit=[ret componentsSeparatedByString:@"\""] ;
    int index;
    //NSLog(@"%@",[locationsplit objectAtIndex:7]);
    //NSLog(@"%f",[[[datasplit objectAtIndex:8]substringFromIndex:1] floatValue]);
    float total=0.0;
    for(index=6;index<[datasplit count]-1;index=index+1)
    {    
        //NSLog(@"%d",[locationsplit count]);
        
        
        if([[datasplit objectAtIndex:index] isEqualToString:@"Value"])
            total=total+[[[datasplit objectAtIndex:index+1]substringFromIndex:1] floatValue];
        //NSLog(@"AID=%d,X=%d,Y=%d",tmpAID,tmpx,tmpy);
        
    }
    NSLog(@"total=%f",total);
    
    return total;
}

-(void)setItemSta:(NSString*)sessionID :(int)SID :(int)Level :(NSString*)IP
{
    //test用
    /*sessionID=[self logintest:@"ipad2" :@"pwd"];
     SID=1;
     Level=2;*/
    
    
    NSString *tmp1=[NSString stringWithFormat:@"%d",SID];
    NSString *tmp2=[NSString stringWithFormat:@"%d",Level];
    NSLog(@"SetSID:%d Level:%d",SID,Level);
    NSString *postStr1 =@"{\"SessionID\":\"";
    NSMutableData *testdata=[NSMutableData data];
    [testdata appendData:[postStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postStr2=@"\",\"ActuatorID\":";
    [testdata appendData:[postStr2 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[tmp1 dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postStr3= @",\"Level\":";
    [testdata appendData:[postStr3 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[tmp2 dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *end=@"}";
    [testdata appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    //NSLog(@"testdata: %@",testdata);
    //NSString *durl= @"http://140.113.166.122:8080/Control";
    NSString * durl=[IP stringByAppendingString:@"/Control"];
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    // NSLog(@"ActuatorControl Ret: %@",ret);
}


-(NSMutableDictionary*)location:(NSString *)sessionID :(NSString*)IP
{
    //test用
    //sessionID=[self logintest:@"ipad2" :@"pwd"];
    
    NSString *postStr =@"{\"SessionID\":\"";
    NSString *poStr1=@"\",\"Type\":\"appliance\",\"Method\":\"list\"}";
    NSMutableData *testdata=[NSMutableData data];
    [testdata  appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[poStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    //NSLog(@"testdata: %@",testdata);
    //NSString *durl= @"http://140.113.166.122:8080/LocationInfo";
    NSString * durl=[IP stringByAppendingString:@"/LocationInfo"];
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Locationlistret: %@",ret);
    
    
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *json = [parser objectWithString:ret error:nil];
    NSString *location=[json objectForKey:@"Location"];
    NSLog(@"Locationlistret: %@",location);
    NSMutableDictionary *result=[[NSMutableDictionary alloc]init];
    NSArray *locationsplit=[ret componentsSeparatedByString:@"\""] ;
    int index;
    //NSLog(@"%@",[locationsplit objectAtIndex:14]);
    //NSLog(@"%d",[[[locationsplit objectAtIndex:8]substringFromIndex:1]intValue]);
    for(index=6;index<[locationsplit count]-1;index=index+6)
    {    
        //NSLog(@"%d",[locationsplit count]);
        int tmpAID=[[[locationsplit objectAtIndex:index+2]substringFromIndex:1]intValue];
        int tmpy=[[[locationsplit objectAtIndex:index+4]substringFromIndex:1]intValue];
        int tmpx=[[[locationsplit objectAtIndex:index+6]substringFromIndex:1]intValue];
        
        int loctmp=tmpx*1000+tmpy;
        NSString *loc=[NSString stringWithFormat:@"%d",loctmp];
        NSString *AID=[NSString stringWithFormat:@"%d",tmpAID];
        
        [result setObject:loc forKey:AID];
        
        //NSLog(@"AID=%d,X=%d,Y=%d",tmpAID,tmpx,tmpy);
        
    }
    
    return result;
}


-(void)setItemLoc:(NSString*)sessionID :(int)AID :(int)x :(int)y :(NSString*)IP
{
    //test用
    /*sessionID=[self logintest:@"ipad2" :@"pwd"];
     AID=2;
     x=5;
     y=4;*/
    
    
    NSString *tmp1=[NSString stringWithFormat:@"%d",AID];
    NSString *tmp2=[NSString stringWithFormat:@"%d",x];
    NSString *tmp3=[NSString stringWithFormat:@"%d",y];
    NSString *postStr1 =@"{\"SessionID\":\"";
    NSMutableData *testdata=[NSMutableData data];
    [testdata   appendData:[postStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata   appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
    NSString    *postStr2=@"\",\"Type\":\"appliance\",\"Method\":\"modify\",\"ApplianceID\":";
    [testdata   appendData:[postStr2 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata   appendData:[tmp1 dataUsingEncoding:NSUTF8StringEncoding]];
    NSString    *postStr3= @",\"X\":";
    [testdata   appendData:[postStr3 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata   appendData:[tmp2 dataUsingEncoding:NSUTF8StringEncoding]];
    NSString    *postStr4= @",\"Y\":";
    [testdata appendData:[postStr4 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[tmp3 dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *end=@"}";
    [testdata appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    //NSLog(@"testdata: %@",testdata);
    //NSString *durl= @"http://140.113.166.122:8080/LocationInfo";
    NSString * durl=[IP stringByAppendingString:@"/LocationInfo"];
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    NSLog(@"SetLoc Ret: %@",ret);
    
}


-(void)setID:(NSString*)sessionID :(int)AID :(NSString*)IP
{
    
    //test用
    //AID=3;
    //sessionID=[self logintest:@"ipad2" :@"pwd"];
    
    
    NSString *postStr =@"{\"Method\":\"add\",\"SessionID\":\"";
    NSString *poStr1=@"\",\"ApplianceID\":";
    NSString *poStr2=@",\"ActuatorID\":";
    NSString *end=@"}";
    NSString *tmpID=[NSString stringWithFormat:@"%d",AID];
    NSMutableData *testdata=[NSMutableData data];
    [testdata appendData:[postStr dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[sessionID dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[poStr1 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[tmpID dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[poStr2 dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[tmpID dataUsingEncoding:NSUTF8StringEncoding]];
    [testdata appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    //NSLog(@"testdata: %@",testdata);
    //NSString *durl= @"http://140.113.166.122:8080/RelationConfig";
    NSString * durl=[IP stringByAppendingString:@"/RelationConfig"];
    
    NSURL *url = [NSURL URLWithString:durl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:testdata];
    
    NSURLResponse *response;
    NSError *error;
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *ret = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    NSLog(@"CreateRelation Ret: %@",ret);
    
}


















/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
