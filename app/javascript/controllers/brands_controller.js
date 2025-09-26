import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="brands"
export default class extends Controller {
  static targets = ["output"]
  static values = {
    clientId: String,
    domain: String,
    width: Number,
    height: Number,
  }

  connect() {
    if (!this.hasDomainValue || !this.hasClientIdValue) {
      console.warn("Logo controller: no domain provided")
      return
    }

    // get client ID from ENV via meta tag
    const clientId = this.clientIdValue
    const domain = this.domainValue
    const width = this.hasWidthValue ? this.widthValue : 20
    const height = this.hasHeightValue ? this.heightValue : 20

    const url = `https://cdn.brandfetch.io/${domain}/w/${width}/h/${height}/theme/light/logo?c=${clientId}`

    this.renderLogo(url)
    console.log("brands", { domain, width, height })
  }

  renderLogo(url) {
    if (this.hasOutputTarget) {
      this.outputTarget.innerHTML = `<img src="${url}" alt="Logo" style="max-width:100%; max-height:100%;" />`
    }
  }
}