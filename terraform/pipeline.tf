#Pipeline
resource "heroku_pipeline" "pipeline" {
  name = "${var.pipeline_name}"
}

# App
resource "heroku_app" "ci" {
  name   = "${var.app_name}-ci"
  region = "eu"
}

resource "heroku_app" "staging" {
  name   = "${var.app_name}-staging"
  region = "eu"
}

resource "heroku_app" "production" {
  name   = "${var.app_name}-production"
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
  pipeline = "${heroku_pipeline.pipeline.id}"
  stage    = "development"
}

resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.pipeline.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.pipeline.id}"
  stage    = "production"
}
