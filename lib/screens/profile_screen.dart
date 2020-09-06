import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:user_profile/constants.dart';
import 'package:user_profile/screens/coins_level.dart';
import 'package:user_profile/screens/help_and_support.dart';
import 'package:user_profile/screens/home_page.dart';
import 'package:user_profile/screens/payment.dart';
import 'package:user_profile/screens/playing_cards.dart';
import 'package:user_profile/screens/profile_details.dart';
import 'package:user_profile/screens/purchase_history.dart';
import 'package:user_profile/screens/referrals_page.dart';
import 'package:user_profile/screens/settings.dart';
import 'package:user_profile/widgets/profile_list_item.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('assets/images/avatar1.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'First & Last name',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'yourname@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Menu',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
        profileInfo,
        themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.home,
                          text: 'Home',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.user_shield,
                          text: 'Profile',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileDetails()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.playstation,
                          text: 'Playing Cards',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayingCards()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.coins,
                          text: 'Coins level',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoinsLevel()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.money_check,
                          text: 'Payment',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.history,
                          text: 'Purchase History',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PurchaseHistory()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.user_friends,
                          text: 'Referrals',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReferralsPage()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.question_circle,
                          text: 'Help & Support',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpAndSupport()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.cog,
                          text: 'Settings',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings()),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: kSpacingUnit.w * 5.5,
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 4,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.user_shield,
                          text: 'Logout',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
