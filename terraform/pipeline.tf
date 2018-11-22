#Pipeline
resource "heroku_pipeline" "test-app" {
  name = "${var.pipeline_name}"
}

# App
resource "heroku_app" "ci" {
  name   = "${var.app_prefix}-app-ci"
  region = "eu"
}

resource "heroku_app" "staging" {
  name   = "${var.app_prefix}-app-staging"
  region = "eu"
}

resource "heroku_app" "production" {
  name   = "${var.app_prefix}-app-production"
  region = "eu"
}

# Hosted Graphite
resource "heroku_addon" "hostedgraphite_ci" {
  app  = "${heroku_app.ci.name}"
  plan = "hostedgraphite:free"
}

resource "heroku_addon" "hostedgraphite_stage" {
  app  = "${heroku_app.staging.name}"
  plan = "hostedgraphite:free"
}

resource "heroku_addon" "hostedgraphite_prod" {
  app  = "${heroku_app.production.name}"
  plan = "hostedgraphite:free"
}

# Coupling
resource "heroku_pipeline_coupling" "ci" {
  app      = "${heroku_app.ci.name}"
  pipeline = "${heroku_pipeline.test-app.id}"
  stage    = "development"
}

resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.test-app.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.test-app.id}"
  stage    = "production"
}
