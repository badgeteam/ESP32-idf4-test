#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_spi_flash.h"

void app_main(void)
{
    printf("Hello world!\n");

    esp_chip_info_t chip_info;
    esp_chip_info(&chip_info);
    printf("Chip has %d CPU cores\n", chip_info.cores);
    printf("Bluetooth: %s\n", (chip_info.features & CHIP_FEATURE_BT) ? "YES" : "NO");
    printf("Bluetooth low energy: %s\n", (chip_info.features & CHIP_FEATURE_BLE) ? "YES" : "NO");
    printf("Silicon revision %d\n", chip_info.revision);
    printf("Storage: %dMB %s flash\n", spi_flash_get_chip_size() / (1024 * 1024),
            (chip_info.features & CHIP_FEATURE_EMB_FLASH) ? "embedded" : "external");

    vTaskDelay(5000 / portTICK_PERIOD_MS);
    fflush(stdout);
    esp_restart();
}
