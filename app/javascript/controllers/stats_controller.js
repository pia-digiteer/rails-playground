import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = ["stats"]
	static values = {
		min: Number,
		max: Number,
		magnitude: Number,
	}

	connect() {
		this.statsTargets.forEach(target => {
			target.textContent = this.generateRandomStats()
		})
	}

	generateRandomStats() {
		// get values from target if set
		const min = this.hasMinValue ? this.minValue : 1
		const max = this.hasMaxValue ? this.maxValue : 99
		const magnitude = this.hasMagnitudeValue ? this.magnitudeValue : 1

		// random integer between min and max (inclusive)
		const base = Math.floor(Math.random() * (max - min + 1)) + min
		const zeros = 10 ** magnitude
		const value = base * zeros

		// format with delimiters (e.g. 12,345)
		const formattedStats = new Intl.NumberFormat().format(value)

		// if you have a target, inject it
		if (this.hasStatsTarget) {
			this.statsTarget.textContent = formattedStats
		}

		console.log("generated stat:", {formattedStats, min, max, magnitude })

		return formattedStats
	}
}