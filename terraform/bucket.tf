
// Create SA
resource "yandex_iam_service_account" "sa-bucket" {
  name = "sa-backet"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "bucket-editor" {
  folder_id = var.folder_id
  role = "storage.editor"
  member = "serviceAccount:${yandex_iam_service_account.sa-bucket.id}"
  #depends_on = [ yandex_iam_service_account.sa-bucket ]
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa-bucket.id
  description = "static access key for bucket"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "netology-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "morozov-netology-bucket"
  acl = "public-read"
  website {
    index_document = "pic.jpg"
#    error_document = "error.html"
  }

  anonymous_access_flags {
    read        = true
    list        = true
    config_read = true
  }
}

// Add picture to bucket
resource "yandex_storage_object" "object-1" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = yandex_storage_bucket.netology-bucket.bucket
  key = "pic.jpg"
  source = "data/pic.jpg"
  acl = "public-read"
  depends_on = [ yandex_storage_bucket.netology-bucket ]
}
