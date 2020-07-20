#import "izaRouteCell.h"

@implementation izaRouteCell {

}

@synthesize name, targetNetwork, gateway, netmask;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.name = [[UILabel alloc] init];
        self.targetNetwork = [[UILabel alloc] init];
        self.gateway = [[UILabel alloc] init];
        self.netmask = [[UILabel alloc] init];

        [self addSubview:self.name];
        [self addSubview:self.targetNetwork];
        [self addSubview:self.gateway];
        [self addSubview:self.netmask];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect nameFrame = CGRectMake(10,2,self.contentView.frame.size.width - 10, 25);
    CGRect targetNetworkFrame = CGRectMake(10,30,self.contentView.frame.size.width - 10, 25);
    CGRect gatewayFrame = CGRectMake(10,58,self.contentView.frame.size.width - 10, 25);
    CGRect netmaskFrame = CGRectMake(10,86,self.contentView.frame.size.width - 10, 25);
    self.name.frame = nameFrame;
    self.targetNetwork.frame = targetNetworkFrame;
    self.gateway.frame = gatewayFrame;
    self.netmask.frame = netmaskFrame;
}

@end