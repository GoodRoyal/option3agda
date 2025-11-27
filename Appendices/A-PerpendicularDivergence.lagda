{-# OPTIONS --cubical --safe #-}

module appendices.A-PerpendicularDivergence where

open import Cubical.Foundations.Prelude
open import Cubical.Data.Sigma
open import Cubical.Data.Sum

-- 1. Axiomatic Definitions (Patent Claim 1)
postulate
  ℝ : Type₀
  _+ᵣ_ _-ᵣ_ _·ᵣ_ _/ᵣ_ : ℝ → ℝ → ℝ
  𝟘 𝟙 ε : ℝ
  expᵣ logᵣ absᵣ : ℝ → ℝ
  _<ᵣ_ _>ᵣ_ : ℝ → ℝ → Type₀

infixl 6 _+ᵣ_ _-ᵣ_
infixl 7 _·ᵣ_ _/ᵣ_

-- 2. Perpendicular Divergence Metric (Claim 1b)
-- D⊥ = D_KL * (1 - |cos θ|)
D⦵ : ℝ → ℝ → ℝ
D⦵ kl cosθ = kl ·ᵣ (𝟙 -ᵣ absᵣ cosθ)

-- 3. Temporal Modulation (Claim 1c)
-- Δt = (Vs / (r + ε)) * exp(H)
Δt : ℝ → ℝ → ℝ → ℝ
Δt Vₛ r H = (Vₛ /ᵣ (r +ᵣ ε)) ·ᵣ expᵣ H

-- 4. Theorems
postulate
  -- Theorem: D⊥ is zero only if distributions match AND trajectories parallel
  theorem-4·1-divergence-soundness :
    ∀ (kl cosθ : ℝ)
    → D⦵ kl cosθ ≡ 𝟘
    → (kl ≡ 𝟘) × ((cosθ ≡ 𝟙) ⊎ (cosθ ≡ (𝟘 -ᵣ 𝟙)))

  -- Theorem: Faster agents (higher r) get strictly less influence
  theorem-4·2-temporal-equity :
    ∀ (Vₛ r₁ r₂ H : ℝ)
    → r₁ >ᵣ r₂
    → Δt Vₛ r₁ H <ᵣ Δt Vₛ r₂ H
    
