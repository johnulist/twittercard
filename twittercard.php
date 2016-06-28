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
        parent::__construct();

        $this->name = 'twittercard';
        $this->tab = 'front_office_features';

        $this->version = '1.0.0';
        $this->author = 'StrikeHawk eCommerce, Inc.';
        $this->displayName = $this->l('Twitter Summary With Large Image Card');
        $this->description = $this->l('Adds Twitter Summary Card with large image to your site');
        $this->need_instance = 0;

        $this->bootstrap = true;
    }

    /**
     * Install the module
     *
     * @return bool Whether the module has been installed successfully
     * @throws PrestaShopException
     */
    public function install()
    {
        $success = parent::install();

        if (!$success) {
            parent::uninstall();

            return false;
        }

        $this->_clearCache('twittercard.tpl');

        $success &= $this->registerHook('header');

        return $success;
    }

    /**
     * Uninstall the module
     *
     * @return bool Whether the module has been successfully uninstalled
     */
    public function uninstall()
    {
        $this->_clearCache('twittercard.tpl');

        Configuration::deleteByName(self::TWITTER_USER);
        Configuration::deleteByName(self::HOME_PAGE_TITLE);
        Configuration::deleteByName(self::HOME_PAGE_DESCRIPTION);
        Configuration::deleteByName(self::HOME_PAGE_IMAGE);
        Configuration::deleteByName(self::HOME_PAGE_LOGO_URL);

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
                    Tools::getValue('id_product').'-'.$cover['id_image'], 'large_default'
                );
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
                    'twitterHomeLogo' => Configuration::get(self::HOME_PAGE_IMAGE),
                    'twitterHomeLogoUrl' => Configuration::get(self::HOME_PAGE_LOGO_URL),
                )
            );

            return $this->display(__FILE__, 'twittercard_index.tpl');
        }

        return '';
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

        $output .= $this->display(__FILE__, 'views/templates/admin/navbar.tpl');

        $this->context->controller->addJS(_PS_MODULE_DIR_.'twittercard/views/js/config.js');

        // When version is 1.6 or higher, this switch defines what page should be shown
        // To just add a new template to a menu item, use the following template and add it to the top:
        // case self::{{menu constant}}:
        // $this->menu = self::{{menu constant}};
        // return $output.$this->display(__FILE__, 'views/templates/admin/{{menu template}}.tpl');
        // break;
        if (version_compare(_PS_VERSION_, '1.6.0.0', '>=')) {
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
        $helper->show_toolbar = true;
        $helper->toolbar_scroll = true;
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


        return $helper->generateForm(array($this->getTwitterCardForm()));
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
        );
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
        if ($success) {
            return $this->displayConfirmation($this->l('Form successfully updated'));
        }

        return $this->displayError($this->l('There was a problem while updating the configuration'));
    }
}
