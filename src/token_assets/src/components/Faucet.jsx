import React, { useState } from "react";
import { token } from "../../../declarations/token/index";

function Faucet() {
  const [isDisabled, setDisable] = useState(false);
  const [buttonText, setText] = useState("Gimme gimme");

  async function handleClick(event) {
    setDisable(true);
    const result = await  token.payOut( );
    setText(result);
    // setDisabled(false);
  }

  return (
    <div className="blue window">
      <h2>
        <span role="img" aria-label="tap emoji">
          🚰
        </span>
        Faucet
      </h2>
      <label>
        Get your free DAngela tokens here! Claim 10,000 DANG token to your
        account.
      </label>
      <p className="trade-buttons">
        <button id="btn-payout" disabled={isDisabled} onClick={handleClick}>
          {buttonText}
        </button>
      </p>
    </div>
  );
}

export default Faucet;
