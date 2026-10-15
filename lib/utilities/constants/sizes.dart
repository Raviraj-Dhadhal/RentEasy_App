class AppSizes {

  // Padding and margin sizes
  static double xs = 4.0;
  static double sm = 8.0;
  static double md = 16.0;
  static double lg = 24.0;
  static double xl = 32.0;

  // Icon sizes
  static double iconXs = 12.0;
  static double iconSm = 16.0;
  static double iconMd = 24.0;
  static double iconLg = 32.0;

  // Font sizes
  static double fontSizeXs = 12.0;
  static double fontSizeSm = 14.0;
  static double fontSizeMd = 16.0;
  static double fontSizeLg = 18.0;
  static double fontSizeCustom = 24.0;

  // Button sizes
  static double buttonHeight = 20.0;
  static double buttonRadius = 16.0;
  static double buttonWidth = 120.0;
  static double buttonElevation = 4.0;

  // AppBar height
  static double appBarHeight = 56.0;

  // Image sizes
  static double imageThumbSize = 80.0;

  // Default spacing between sections
  static double defaultSpace = 24.0;
  static double spaceBtwItems = 16.0;
  static double spaceBtwSections = 32.0;

  // Border radius
  double borderRadiusSm = 4.0;
  double borderRadiusMd = 8.0;
  double borderRadiusLg = 12.0;

  // Divider height
  double dividerHeight = 1.0;

  // Product item dimensions
  double productImageSize = 120.0;
  double productImageRadius = 16.0;
  double productItemHeight = 160.0;

  // Input field
  double inputFieldRadius = 12.0;
  static double spaceBtwInputFields = 16.0;

  // Card sizes
  double cardRadiusLg = 16.0;
  double cardRadiusMd = 12.0;
  double cardRadiusSm = 10.0;
  double cardRadiusXs = 6.0;
  double cardElevation = 2.0;

  // Image carousel height
  double imageCarouselHeight = 200.0;

  // Loading indicator size
  double loadingIndicatorSize = 36.0;

  // Grid view spacing
  double gridViewSpacing = 16.0;

  // Responsive Screen Sizes
  int desktopScreenSize = 1366;
  int tabletScreenSize = 768;
  int mobileScreenSize = 360;
  int customScreenSize = 1100;

  // Optional initializer to override default sizes
  AppSizes init({
    double? xsSize,
    double? smSize,
    double? mdSize,
    double? lgSize,
    double? xlSize,
    double? iconXsSize,
    double? iconSmSize,
    double? iconMdSize,
    double? iconLgSize,
    double? fontSizeSmValue,
    double? fontSizeMdValue,
    double? fontSizeLgValue,
    double? buttonHeightValue,
    double? buttonRadiusValue,
    double? buttonWidthValue,
    double? buttonElevationValue,
    double? appBarHeightValue,
    double? imageThumbSizeValue,
    double? defaultSpaceValue,
    double? spaceBtwItemsValue,
    double? spaceBtwSectionsValue,
    double? borderRadiusSmValue,
    double? borderRadiusMdValue,
    double? borderRadiusLgValue,
    double? dividerHeightValue,
    double? productImageSizeValue,
    double? productImageRadiusValue,
    double? productItemHeightValue,
    double? inputFieldRadiusValue,
    double? spaceBtwInputFieldsValue,
    double? cardRadiusLgValue,
    double? cardRadiusMdValue,
    double? cardRadiusSmValue,
    double? cardRadiusXsValue,
    double? cardElevationValue,
    double? imageCarouselHeightValue,
    double? loadingIndicatorSizeValue,
    double? gridViewSpacingValue,
    int? desktopScreenSizeValue,
    int? tabletScreenSizeValue,
    int? mobileScreenSizeValue,
    int? customScreenSizeValue,
  }) {
    // Padding and margin sizes
    xs = xsSize ?? xs;
    sm = smSize ?? sm;
    md = mdSize ?? md;
    lg = lgSize ?? lg;
    xl = xlSize ?? xl;

    // Icon sizes
    iconXs = iconXsSize ?? iconXs;
    iconSm = iconSmSize ?? iconSm;
    iconMd = iconMdSize ?? iconMd;
    iconLg = iconLgSize ?? iconLg;

    // Font sizes
    fontSizeSm = fontSizeSmValue ?? fontSizeSm;
    fontSizeMd = fontSizeMdValue ?? fontSizeMd;
    fontSizeLg = fontSizeLgValue ?? fontSizeLg;

    // Button sizes
    buttonHeight = buttonHeightValue ?? buttonHeight;
    buttonRadius = buttonRadiusValue ?? buttonRadius;
    buttonWidth = buttonWidthValue ?? buttonWidth;
    buttonElevation = buttonElevationValue ?? buttonElevation;

    // AppBar height
    appBarHeight = appBarHeightValue ?? appBarHeight;

    // Image sizes
    imageThumbSize = imageThumbSizeValue ?? imageThumbSize;

    // Default spacing between sections
    defaultSpace = defaultSpaceValue ?? defaultSpace;
    spaceBtwItems = spaceBtwItemsValue ?? spaceBtwItems;
    spaceBtwSections = spaceBtwSectionsValue ?? spaceBtwSections;

    // Border radius
    borderRadiusSm = borderRadiusSmValue ?? borderRadiusSm;
    borderRadiusMd = borderRadiusMdValue ?? borderRadiusMd;
    borderRadiusLg = borderRadiusLgValue ?? borderRadiusLg;

    // Divider height
    dividerHeight = dividerHeightValue ?? dividerHeight;

    // Product item dimensions
    productImageSize = productImageSizeValue ?? productImageSize;
    productImageRadius = productImageRadiusValue ?? productImageRadius;
    productItemHeight = productItemHeightValue ?? productItemHeight;

    // Input field
    inputFieldRadius = inputFieldRadiusValue ?? inputFieldRadius;
    spaceBtwInputFields = spaceBtwInputFieldsValue ?? spaceBtwInputFields;

    // Card sizes
    cardRadiusLg = cardRadiusLgValue ?? cardRadiusLg;
    cardRadiusMd = cardRadiusMdValue ?? cardRadiusMd;
    cardRadiusSm = cardRadiusSmValue ?? cardRadiusSm;
    cardRadiusXs = cardRadiusXsValue ?? cardRadiusXs;
    cardElevation = cardElevationValue ?? cardElevation;

    // Image carousel height
    imageCarouselHeight = imageCarouselHeightValue ?? imageCarouselHeight;

    // Loading indicator size
    loadingIndicatorSize = loadingIndicatorSizeValue ?? loadingIndicatorSize;

    // Grid view spacing
    gridViewSpacing = gridViewSpacingValue ?? gridViewSpacing;

    // Responsive Sizes
    desktopScreenSize = desktopScreenSizeValue ?? desktopScreenSize;
    tabletScreenSize = tabletScreenSizeValue ?? tabletScreenSize;
    mobileScreenSize = mobileScreenSizeValue ?? mobileScreenSize;
    customScreenSize = customScreenSizeValue ?? customScreenSize;

    return this;
  }
}
