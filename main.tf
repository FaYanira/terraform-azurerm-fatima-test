data "azuread_application_template" "example" {
  display_name = "Marketo"
}

resource "azuread_application" "example" {
  display_name = "example"
  template_id  = data.azuread_application_template.example.id
}

resource "azuread_service_principal" "example" {
  application_id = azuread_application.example.application_id
  use_existing   = true
}

provider "azuread" {
  tenant_id = "274cc2da-6649-4524-b4fe-1ff1e0ec0f9a"
}
