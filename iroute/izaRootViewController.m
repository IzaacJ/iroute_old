#import "izaRootViewController.h"
#import "izaRouteCell.h"
#import <UIKit/UIKit.h>

@interface izaRootViewController ()
{
	UITextField *_name;
	UITextField *_targetNetwork;
	UITextField *_gateway;
	UITextField *_netmask;
	NSUserDefaults *defaults;
}
@property (nonatomic, strong) NSMutableArray * objects;
@end

@implementation izaRootViewController

- (void)loadView {
	[super loadView];

	defaults = [NSUserDefaults standardUserDefaults]; 
	_objects = [NSMutableArray arrayWithArray:[defaults arrayForKey:@"routes"]];

	self.title = @"iRoute";
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
}

- (void)addButtonTapped:(id)sender {UIAlertController *_puv = [UIAlertController alertControllerWithTitle:@"Add Route" message:@"" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *_defAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		NSLog(@"iRoute:alertView - Added!");
		UITextField *__name = (UITextField *)_puv.textFields[0];
		UITextField *__targetNetwork = (UITextField *)_puv.textFields[1];
		UITextField *__gateway = (UITextField *)_puv.textFields[2];
		UITextField *__netmask = (UITextField *)_puv.textFields[3];

		NSMutableArray *route = [[NSMutableArray alloc] init];
		[route addObject:__name.text];
		[route addObject:__targetNetwork.text];
		[route addObject:__gateway.text];
		[route addObject:__netmask.text];

		NSLog(@"iRoute:alertView - Name = %@", route[0]);
		NSLog(@"iRoute:alertView - TargetNetwork = %@", route[1]);
		NSLog(@"iRoute:alertView - Gateway = %@", route[2]);
		NSLog(@"iRoute:alertView - Netmask = %@", route[3]);
		
		[_objects insertObject:route atIndex:0];
		[defaults setObject:_objects forKey:@"routes"];
		[self.tableView insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:0 inSection:0] ] withRowAnimation:UITableViewRowAnimationAutomatic];
		
		NSLog(@"iRoute:alertView - Dialog processed!");
	}];
	UIAlertAction *_cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
		NSLog(@"iRoute:alertView - Canceled!");
	}];

	[_puv addTextFieldWithConfigurationHandler:^(UITextField *_nameField) {
		_name = _nameField;
		_nameField.borderStyle = UITextBorderStyleRoundedRect;
		_nameField.placeholder = @"Name";
		_nameField.keyboardAppearance = UIKeyboardAppearanceAlert;
		_nameField.delegate = self;
	}];
	[_puv addTextFieldWithConfigurationHandler:^(UITextField *_targetNetworkField) {
		_targetNetwork = _targetNetworkField;
		_targetNetworkField.borderStyle = UITextBorderStyleRoundedRect;
		_targetNetworkField.placeholder = @"Target Network";
		_targetNetworkField.keyboardAppearance = UIKeyboardAppearanceAlert;
		_targetNetworkField.delegate = self;
	}];
	[_puv addTextFieldWithConfigurationHandler:^(UITextField *_gatewayField) {
		_gateway = _gatewayField;
		_gatewayField.borderStyle = UITextBorderStyleRoundedRect;
		_gatewayField.placeholder = @"Gateway";
		_gatewayField.keyboardAppearance = UIKeyboardAppearanceAlert;
		_gatewayField.delegate = self;
	}];
	[_puv addTextFieldWithConfigurationHandler:^(UITextField *_netmaskField) {
		_netmask = _netmaskField;
		_netmaskField.borderStyle = UITextBorderStyleRoundedRect;
		_netmaskField.placeholder = @"Netmask";
		_netmaskField.keyboardAppearance = UIKeyboardAppearanceAlert;
		_netmaskField.delegate = self;
	}];

	[_puv addAction:_defAction];
	[_puv addAction:_cancelAction];
	[self presentViewController:_puv animated:YES completion:nil];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
	izaRouteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (!cell) {
		cell = [[izaRouteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}

	NSMutableArray *route = _objects[indexPath.row];
	cell.name.text = route[0];
	cell.targetNetwork.text = route[1];
	cell.gateway.text = route[2];
	cell.netmask.text = route[3];
	return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
	switch (indexPath.section) {
		case 1:
			return 60;
		default:
			return UITableViewAutomaticDimension;
	}
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	[_objects removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
