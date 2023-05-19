resource "azurerm_api_management_api" "apim-api" {
  name                = replace("apim-api-${var.resource_suffix_split}", "application", var.application)
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  revision            = var.revision
  display_name        = var.display_name
  path                = var.path
  protocols           = var.protocols
  service_url         = "https://${var.service_url}"
  
 # oauth2_authorization {
 #   authorization_server_name = "ats-dev-keycloak"
 # }
  

  import {
    content_format = "swagger-json"
    content_value  = <<JSON
      {
          "swagger": "2.0",
          "info": {
              "version": "1.0.0",
              "title": "${var.display_name}" 
          },
          "basePath": "/",
          "schemes": [
              "https"
          ],
          "consumes": [
              "application/json"
          ],
          "produces": [
              "application/json"
          ],
          "paths": {
              "/": {
                  "get": {
                      "operationId": "ping",
                      "responses": {}
                  }
              }
          }
      }
    JSON
  }
}