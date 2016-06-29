<?php
/**
 * Copyright (C) StrikeHawk eCommerce, Inc. - All Rights Reserved
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited
 *
 * @author    StrikeHawk eCommerce, Inc. <sales@services.strikehawk.com>
 * @copyright 2016 StrikeHawk eCommerce, Inc.
 * @license   proprietary
 * Intellectual Property of StrikeHawk eCommerce, Inc.
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

/**
 * Class TwitterCard
 */
class TwitterCard extends Module
{
    const TWITTER_USER = 'TWITTERCARD_TWITTERNAME';
    const HOME_PAGE_TITLE = 'TWITTERCARD_TWITTERHOMETITLE';
    const HOME_PAGE_DESCRIPTION = 'TWITTERCARD_TWITTERHOMEDESC';
    const HOME_PAGE_IMAGE = 'TWITTERCARD_TWITTERHOMEIMAGE';
    const HOME_PAGE_LOGO_URL = 'TWITTERCARD_TWITTERHOMEIMAGEURL';
    const REGENERATE_IMAGES = 'TWITTERCARD_REGENERATE_IMAGES';
    const MAX_EXECUTION_TIME = 7200;

    // In order to add a new tab: define a new menu constant here and assign a unique positive number
    const MENU_SETTINGS = 1;
    const MENU_INFO = 2;

    public $menu;
    public $moduleUrl;

    /**
     * TwitterCard constructor.
     */
    public function __construct()
    {
        $this->name = 'twittercard';
        $this->tab = 'front_office_features';
        $this->version = '1.0.2';
        $this->author = 'StrikeHawk eCommerce, Inc.';
        $this->need_instance = 0;

        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Twitter Summary With Large Image Card');
        $this->description = $this->l('Adds Twitter Summary Card with large image to your site');
    }


    /**
     * Install the module
     *
     * @return bool Whether the module has been installed successfully
     * @throws PrestaShopException
     */
    public function install()
    {
        return parent::install() &&
            $this->installImageType() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader');
    }

    /**
     * Uninstall the module
     *
     * @return bool Whether the module has been successfully uninstalled
     */
    public function uninstall()
    {
        Configuration::deleteByName(self::TWITTER_USER);
        Configuration::deleteByName(self::HOME_PAGE_TITLE);
        Configuration::deleteByName(self::HOME_PAGE_DESCRIPTION);
        Configuration::deleteByName(self::HOME_PAGE_IMAGE);
        Configuration::deleteByName(self::HOME_PAGE_LOGO_URL);

        $this->uninstallImageType();

        return parent::uninstall();
    }

    /**
     * Hook to the FO pages' <HEAD></HEAD> tags
     *
     * @param array $params Hook parameters
     * @return string Hook HTML
     */
    public function hookHeader($params)
    {
        $link = $this->context->link;
        $smarty = $this->context->smarty;
        $cookie = $this->context->cookie;
        if (Tools::getValue('controller') == 'product') {
            $cover = Product::getCover((int) Tools::getValue('id_product'));
            $product = new Product(Tools::getValue('id_product'), true, (int) $this->context->language->id);
            if (is_array($cover) && sizeof($cover) == 1) {
                /** @var Image $image */
                $image = Image::getCover((int) $product->id);
                $twitterImage = $link->getImageLink(
                    $product->link_rewrite[$cookie->id_lang],
                    Tools::getValue('id_product').'-'.$cover['id_image'], 'twitter_default');
            }

            $smarty->assign(
                array(
                    'twitterUser' => Configuration::get(self::TWITTER_USER),
                    'twitterSite' => Configuration::get(self::TWITTER_USER),
                    'twitterProductName' => $product->name,
                    'twitterDescription' => $product->description_short,
                    'twitterImage' => isset($twitterImage) ? $twitterImage : '',
                    'twitterImageAlt' => (isset($image) && !empty($image->legend)) ? $image->legend : strip_tags($product->description_short),
                    'twitterPrice' => $product->price,
                )
            );

            return $this->display(__FILE__, 'twittercard_product.tpl');
        } elseif (Tools::getValue('controller') == 'index') {
            $smarty->assign(
                array(
                    'twitterUser' => Configuration::get(self::TWITTER_USER),
                    'twitterSite' => Configuration::get(self::TWITTER_USER),
                    'twitterHomeTitle' => Configuration::get(self::HOME_PAGE_TITLE),
                    'twitterHomeDescription' => Configuration::get(self::HOME_PAGE_DESCRIPTION),
                    'twitterHomeLogo' => (bool) Configuration::get(self::HOME_PAGE_IMAGE),
                    'twitterHomeLogoUrl' => Configuration::get(self::HOME_PAGE_LOGO_URL),
                )
            );

            return $this->display(__FILE__, 'twittercard_index.tpl');
        }

        return '';
    }

    /**
     * Hook to the BO pages' <HEAD></HEAD> tags
     *
     * @param array $params Hook parameters
     * @return string Hook HTML
     */
    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('module_name') == $this->name) {
            if (version_compare(_PS_VERSION_, '1.6.0.0', '>=')) {
                $this->context->controller->addJS($this->_path.'views/js/v1-config.js');
            } else {
                $this->context->controller->addJS($this->_path.'views/js/v1-config_15.js');
            }
        }
    }

    /**
     * Get the module's configuration page
     *
     * @return string Configuration page HTML
     */
    public function getContent()
    {
        $this->moduleUrl = Context::getContext()->link->getAdminLink('AdminModules', false).'&token='.Tools::getAdminTokenLite('AdminModules').'&'.http_build_query(array('configure' => $this->name));
        $this->context->smarty->assign(array(
            'displayName' => $this->displayName,
            'moduleUrl' => $this->moduleUrl,
            'menuTabs' => $this->initNavigation()
        ));

        $output = '';

        if (Tools::isSubmit('submit'.$this->name)) {
            $output .= $this->postProcess();
        }

        // When version is 1.6 or higher, this switch defines what page should be shown
        // To just add a new template to a menu item, use the following template and add it to the top:
        // case self::{{menu constant}}:
        // $this->menu = self::{{menu constant}};
        // return $output.$this->display(__FILE__, 'views/templates/admin/{{menu template}}.tpl');
        // break;
        if (version_compare(_PS_VERSION_, '1.6.0.0', '>=')) {
            $output .= $this->display(__FILE__, 'views/templates/admin/navbar.tpl');

            switch (Tools::getValue('menu')) {
                case self::MENU_INFO:
                    $this->menu = self::MENU_INFO;

                    return $output.$this->display(__FILE__, 'views/templates/admin/info.tpl');
                    break;
                default:
                    $this->menu = self::MENU_SETTINGS;

                    return $output.$this->displayForm();
                    break;
            }
        } else {
            $output .= $this->display(__FILE__, 'views/templates/admin/info.tpl');
        }

        return $output.$this->displayForm();
    }

    /**
     *  Configuration Page: display form
     */
    public function displayForm()
    {
        // Get default language
        $defaultLang = (int) Configuration::get('PS_LANG_DEFAULT');

        $helper = new HelperForm();

        // Module, token and currentIndex
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;

        // Language
        $helper->default_form_language = $defaultLang;
        $helper->allow_employee_form_lang = $defaultLang;

        // Title and toolbar
        $helper->title = $this->displayName;
        $helper->show_toolbar = false;
        $helper->toolbar_scroll = false;
        $helper->submit_action = 'submit'.$this->name;
        $helper->toolbar_btn = array(
            'save' =>
                array(
                    'desc' => $this->l('Save'),
                    'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
                        '&token='.Tools::getAdminTokenLite('AdminModules'),
                ),
                'back' => array(
                    'href' => AdminController::$currentIndex.'&token='.Tools::getAdminTokenLite('AdminModules'),
                     'desc' => $this->l('Back to list'),
                ),
            );
        $helper->fields_value = $this->getFormValues();


        return $helper->generateForm(array($this->getTwitterCardForm(), $this->getRegenerateForm()));
    }

    /**
     * Get the Twitter Card form
     *
     * @return array Form structure
     */
    protected function getTwitterCardForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Twitter Card Configuration'),
                    'icon' => 'icon-cogs',
                ),
                'description' => sprintf($this->l('You can test your Twitter Cards %shere.%s'), '<a href="https://dev.twitter.com/docs/cards/validation/validator" target="_blank">', '</a>'),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->l('Twitter name (ex. @strikehawkecomm)'),
                        'name' => self::TWITTER_USER,
                        'required' => true,
                    ),
                    array(
                        'type' => 'text',
                        'label' => $this->l('Home Page Title'),
                        'name' => self::HOME_PAGE_TITLE,
                        'required' => true,
                    ),
                    array(
                        'type' => 'textarea',
                        'label' => $this->l('Home Page Description (limit: 200 chars)'),
                        'name' => self::HOME_PAGE_DESCRIPTION,
                        'required' => true,
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Home page image'),
                        'name' => self::HOME_PAGE_IMAGE,
                        'is_bool' => true,
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Yes'),
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('No'),
                            ),
                        ),
                    ),
                    array(
                        'type' => 'text',
                        'label' => $this->l('Enter the logo URL'),
                        'name' => self::HOME_PAGE_LOGO_URL,
                        'required' => true,
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }

    /**
     * Get regenerate form
     *
     * @return array Form structure
     */
    protected function getRegenerateForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Regenerate product images'),
                    'icon' => 'icon-cogs',
                ),
                'description' => $this->l('After installing this module, a new image type has been defined (twitter_default) in order to fit images in the Twitter Card. In order to show already existing product images in the Twitter Card they will have to be regenerated first. You can do that with this option.'),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->l('I would like to regenerate product images'),
                        'name' => self::REGENERATE_IMAGES,
                        'is_bool' => true,
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Yes'),
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('No'),
                            ),
                        ),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Regenerate'),
                    'icon' => 'process-icon-cogs'
                ),
            ),
        );
    }

    /**
     * Get form values
     *
     * @return array Form values
     */
    protected function getFormValues()
    {
        return array(
            self::TWITTER_USER => Configuration::get(self::TWITTER_USER),
            self::HOME_PAGE_TITLE => Configuration::get(self::HOME_PAGE_TITLE),
            self::HOME_PAGE_DESCRIPTION => Configuration::get(self::HOME_PAGE_DESCRIPTION),
            self::HOME_PAGE_IMAGE => Configuration::get(self::HOME_PAGE_IMAGE),
            self::HOME_PAGE_LOGO_URL => Configuration::get(self::HOME_PAGE_LOGO_URL),
            self::REGENERATE_IMAGES => false,
        );
    }

    /**
     * Install Twitter image type
     * Dimension: 440px x 220px
     */
    protected function installImageType()
    {
        if (!ImageType::typeAlreadyExists('twitter_default')) {
            $imageType = new ImageType();
            $imageType->name = 'twitter_default';
            $imageType->width = 440;
            $imageType->height = 220;
            $imageType->products = true;
            $imageType->categories = false;
            $imageType->manufacturers = false;
            $imageType->suppliers = false;
            $imageType->scenes = false;
            $imageType->stores = false;

            return $imageType->add();
        }

        return true;
    }

    /**
     * Uninstall Twitter image type
     * Dimension: 440px x 220px
     */
    protected function uninstallImageType()
    {
        if (ImageType::typeAlreadyExists('twitter_default')) {
            $sql = new DbQuery();
            $sql->select('it.`id_image_type`');
            $sql->from('image_type', 'it');
            $sql->where('it.`name` = \'twitter_default\'');

            $imageType = new ImageType((int) Db::getInstance(_PS_USE_SQL_SLAVE_)->getValue($sql));

            if (Validate::isLoadedObject($imageType)) {
                return $imageType->delete();
            }
        }

        return true;
    }

    /**
     * Initialize navigation
     *
     * @return array Menu items
     */
    protected function initNavigation()
    {
        /*
         * This array defines the menu items
         * In order to add a new menu, you will have to add a new sub array:
         * array(
         *     'short' => $this->l('{{menu display name}}'),
         *     'desc' => $this->l('{{menu description}}'),
         *     'href' => $this->moduleUrl.'&menu='.self::{{menu constant name}},
         *     'active' => false,
         *     'icon' => '{{menu icon}}'
         *   )
         */
        $menu = array(
            'settings' => array(
                'short' => $this->l('Settings'),
                'desc' => $this->l('Module settings'),
                'href' => $this->moduleUrl.'&menu='.self::MENU_SETTINGS,
                'active' => false,
                'icon' => 'icon-gears'
            ),
            'info' => array(
                'short' => $this->l('Information'),
                'desc' => $this->l('Information'),
                'href' => $this->moduleUrl.'&menu='.self::MENU_INFO,
                'active' => false,
                'icon' => 'icon-question'
            ),
        );

        /*
         * This helps making the right tab active
         * When adding a new tab, use the following template and add it to the top of the switch:
         * case {{menu constant name}}:
         *     $this->menu = self::{{menu constant name}};
         *     $menu['{{menu name}}']['active'] = true;
         *     break;
         */
        switch (Tools::getValue('menu')) {
            case self::MENU_INFO:
                $this->menu = self::MENU_INFO;
                $menu['info']['active'] = true;
                break;
            default:
                $this->menu = self::MENU_SETTINGS;
                $menu['settings']['active'] = true;
                break;
        }

        return $menu;
    }

    /**
     * Post process configuration form
     */
    protected function postProcess()
    {
        $success = true;
        foreach ($this->getFormValues() as $key => $value) {
            if (Tools::isSubmit($key)) {
                if (!Configuration::updateValue($key, Tools::getValue($key))) {
                    $success = false;
                }
            }
        }
        if (Tools::getValue(self::REGENERATE_IMAGES)) {
            $this->regenerateThumbnails('twitter_default', true);
        }

        if ($success) {
            return $this->displayConfirmation($this->l('Form successfully updated'));
        }

        return $this->displayError($this->l('There was a problem while updating the configuration'));
    }

    /**
     * Regenerate thumbnails
     *
     * @param string $type            Image type
     * @param bool   $deleteOldImages Delete old images first
     * @return bool Whether images have been regenerated successfully
     */
    protected function regenerateThumbnails($type = 'all', $deleteOldImages = false)
    {
        $this->start_time = time();
        ini_set('max_execution_time', self::MAX_EXECUTION_TIME); // ini_set may be disabled, we need the real value
        $this->max_execution_time = (int)ini_get('max_execution_time');
        ignore_user_abort(true);
        $languages = Language::getLanguages(false);

        $process = array(
            array('type' => 'categories', 'dir' => _PS_CAT_IMG_DIR_),
            array('type' => 'manufacturers', 'dir' => _PS_MANU_IMG_DIR_),
            array('type' => 'suppliers', 'dir' => _PS_SUPP_IMG_DIR_),
            array('type' => 'scenes', 'dir' => _PS_SCENE_IMG_DIR_),
            array('type' => 'products', 'dir' => _PS_PROD_IMG_DIR_),
            array('type' => 'stores', 'dir' => _PS_STORE_IMG_DIR_)
        );

        // Launching generation process
        foreach ($process as $proc) {
            if ($type != 'all' && $type != $proc['type']) {
                continue;
            }

            // Getting format generation
            $formats = ImageType::getImagesTypes($proc['type']);
            if ($type != 'all') {
                $format = strval(Tools::getValue('format_'.$type));
                if ($format != 'all') {
                    foreach ($formats as $k => $form) {
                        if ($form['id_image_type'] != $format) {
                            unset($formats[$k]);
                        }
                    }
                }
            }

            if ($deleteOldImages) {
                $this->_deleteOldImages($proc['dir'], $formats, ($proc['type'] == 'products' ? true : false));
            }
            if (($return = $this->_regenerateNewImages($proc['dir'], $formats, ($proc['type'] == 'products' ? true : false))) === true) {
                if (!count($this->errors)) {
                    $this->errors[] = sprintf(Tools::displayError('Cannot write images for this type: %s. Please check the %s folder\'s writing permissions.'), $proc['type'], $proc['dir']);
                }
            } elseif ($return == 'timeout') {
                $this->errors[] = Tools::displayError('Only part of the images have been regenerated. The server timed out before finishing.');
            } else {
                if ($proc['type'] == 'products') {
                    if ($this->_regenerateWatermark($proc['dir'], $formats) == 'timeout') {
                        $this->errors[] = Tools::displayError('Server timed out. The watermark may not have been applied to all images.');
                    }
                }
                if (!count($this->errors)) {
                    if ($this->_regenerateNoPictureImages($proc['dir'], $formats, $languages)) {
                        $this->errors[] = sprintf(Tools::displayError('Cannot write "No picture" image to (%s) images folder. Please check the folder\'s writing permissions.'), $proc['type']);
                    }
                }
            }
        }

        return (count($this->errors) > 0 ? false : true);
    }
}
