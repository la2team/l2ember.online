<?php

namespace Ofey\Logan22\model\config;

use Ofey\Logan22\component\alert\board;
use Ofey\Logan22\component\captcha\google;
use Ofey\Logan22\component\lang\lang;
use Ofey\Logan22\controller\config\config;
use Ofey\Logan22\model\db\sql;
use SimpleCaptcha\Builder;

class captcha
{

    private bool $defaultCaptcha = false;

    private bool $googleCaptcha = true;

    private string $googleClientKey = "6LfYfBAqAAAAAGcGPhaAELg4dM8SwtrcJvikjAPk";

    private string $googleServerKey = "6LfYfBAqAAAAACo159qCMiiN4MEnqnLducBWJrov";

    public function __construct()
    {
        $configData = sql::getRow("SELECT * FROM `settings` WHERE `key` = '__config_captcha__'");
        if ($configData) {
            $setting               = json_decode($configData['setting'], true);
            $this->defaultCaptcha  = filter_var($setting['defaultCaptcha'], FILTER_VALIDATE_BOOLEAN);
            $this->googleCaptcha   = filter_var($setting['googleCaptcha'], FILTER_VALIDATE_BOOLEAN);
            $this->googleClientKey = $setting['googleClientKey'];
            $this->googleServerKey = $setting['googleServerKey'];
        }
    }

    public function isDefaultCaptcha(): bool
    {
        return $this->defaultCaptcha;
    }

    public function getGoogleClientKey(): string
    {
        return $this->googleClientKey;
    }

    public function getGoogleServerKey(): string
    {
        return $this->googleServerKey;
    }

    public function validator(): void
    {
        if ($this->getCaptcha() == "google") {

            if(!isset($_POST['g-recaptcha-response'])){
                board::notice(false, "Google recaptcha не вернула ответ");
            }

            //для V2 Google Captcha
            $g_captcha = google::check($_POST['g-recaptcha-response'] ?? null);
            if (isset($g_captcha['success'])) {
                if ( ! $g_captcha['success']) {
                    board::notice(false, "Google recaptcha не вернула ответ");
                }
            }
        } elseif ($this->getCaptcha() == "default") {
            $builder = new Builder();
            $captcha = $_POST['captcha'] ?? false;
            if ( ! $builder->compare(trim(mb_strtolower($captcha)), mb_strtolower($_SESSION['captcha']))) {
                board::response(
                  "notice",
                  [
                    "message"       => lang::get_phrase(295),
                    "ok"            => false,
                    "reloadCaptcha" => config::load()->captcha()->isGoogleCaptcha() == false,
                  ]
                );
            }
        }
    }

    /**
     * Возвращает название капчи, которая будет использоваться.
     *
     * @return string
     */
    public function getCaptcha(): string
    {
        if ($this->defaultCaptcha) {
            return "default";
        }
        if ($this->googleCaptcha) {
            if (empty($this->googleClientKey) or empty($this->googleServerKey)) {
                return "default";
            }

            return "google";
        }

        return "default";
    }

    public function isGoogleCaptcha(): bool
    {
        return $this->googleCaptcha;
    }

}