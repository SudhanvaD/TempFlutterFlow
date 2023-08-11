// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewCustomWidgett extends StatefulWidget {
  const NewCustomWidgett({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _NewCustomWidgettState createState() => _NewCustomWidgettState();
}

class _NewCustomWidgettState extends State<NewCustomWidgett> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialogPaymentez(context);
          },
          child: Text('Agregar tarjeta'),
        ),
      ),
    );
  }

  void showDialogPaymentez(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Dialog'),
          content: Container(
            height: 300,
            child: InAppWebView(
              initialData: InAppWebViewInitialData(
                data: '''
                  <!DOCTYPE html>
                  <html>
                  <head>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <script src="https://cdn.paymentez.com/ccapi/sdk/payment_sdk_stable.min.js" charset="UTF-8"></script>
                    <style>
                      /* Container styling example */
                      #payment_example_div {
                        max-width: 600px;
                        min-width: 400px;
                        margin: 10 auto;
                      }

                      #payment_example_div > * {
                        margin: 10 auto;
                      }

                      .tok_btn:hover {
                        cursor: pointer;
                      }

                      .tok_btn:disabled, #tok_btn[disabled] {
                        opacity: .65;
                        cursor: not-allowed;
                      }

                      .tok_btn {
                        background: linear-gradient(to bottom, rgba(140, 197, 65, 1) 0%, rgba(20, 167, 81, 1) 100%);
                        color: #fff;
                        width: 80%;
                        border: 1px solid rgba(46, 86, 153, 0.0980392);
                        border-bottom-color: rgba(46, 86, 153, 0.4);
                        border-top: 0;
                        border-radius: 4px;
                        font-size: 17px;
                        text-shadow: rgba(46, 86, 153, 0.298039) 0px -1px 0px;
                        line-height: 34px;
                        -webkit-font-smoothing: antialiased;
                        font-weight: bold;
                        display: block;
                      }

                      #retry_btn {
                        display: none;
                      }
                    </style>
                  </head>
                  <body>
                    <!-- Container to contain the dynamic form -->
                    <div id="payment_example_div">
                      <div id="tokenize_example"></div>
                      <div id="response"></div>
                      <button id="tokenize_btn" class="tok_btn">Save card</button>
                      <button id="retry_btn" class="tok_btn" style="display: none">Save new card</button>
                    </div>

                    <script>
                      // Execute immediately
                      (function () {
                        // === Variable to use ===
                        let environment = 'stg';
                        let application_code = 'APP-CODE-CLIENT'; // Provided by Payment Gateway
                        let application_key = 'app_key_client'; // Provided by Payment Gateway
                        let submitButton = document.querySelector('#tokenize_btn');
                        let retryButton = document.querySelector('#retry_btn');
                        let submitInitialText = submitButton.textContent;

                        // Get the required additional data to tokenize card
                        let get_tokenize_data = () => {
                          let data = {
                            locale: 'en',
                            user: {
                              id: String(Math.floor(new Date().getTime() / 1000)),
                              email: 'jhon@doe.com',
                            },
                            configuration: {
                              default_country: 'COL',
                            },
                          };
                          return data;
                        };

                        // === Required callbacks ===
                        // Executed when the 'tokenize' function is called but the form is not completed.
                        let notCompletedFormCallback = () => {
                          let message = 'Form is not completed';
                          document.getElementById('response').innerHTML = 'Not completed form: Form is not completed, Please fill required data';
                          submitButton.innerText = submitInitialText;
                          submitButton.removeAttribute('disabled');
                        };

                        // Executed when the 'tokenize' function is called and the service responds successfully.
                        let responseCallback = (response) => {
                          // Example of success tokenization.
                          // {
                          //   "card": {
                          //     "bin": "411111",
                          //     "status": "valid",
                          //     "token": "2508629432271853872",
                          //     "message": "",
                          //     "expiry_year": "2033",
                          //     "expiry_month": "12",
                          //     "transaction_reference": "RB-143809",
                          //     "type": "vi",
                          //     "number": "1111"
                          //   }
                          // }

                          // Example of failed tokenization. The error format is always the same, only the value of type, help, description changes.
                          // {
                          //   "error": {
                          //     "type": "Card already added: 2508629432271853872",
                          //     "help": "If you want to update the card, first delete it",
                          //     "description": "{}"
                          //   }
                          // }
                          document.getElementById('response').innerHTML = JSON.stringify(response);
                          retryButton.style.display = 'block';
                          submitButton.style.display = 'none';
                        };

                        // 2. Instance the PaymentGateway with the required parameters.
                        let pg_sdk = new PaymentGateway(environment, application_code, application_key);

                        // 3. Generate the tokenization form with the required data.
                        // At this point, the form is rendered on the page.
                        pg_sdk.generate_tokenize(get_tokenize_data(), '#tokenize_example', responseCallback, notCompletedFormCallback);

                        // 4. Define the event to execute the tokenize action.
                        submitButton.addEventListener('click', (event) => {
                          document.getElementById('response').innerHTML = '';
                          submitButton.innerText = 'Card Processing...';
                          submitButton.setAttribute('disabled', 'disabled');
                          pg_sdk.tokenize();
                          event.preventDefault();
                        });

                        // Define a button to create a new form and save a new card.
                        retryButton.addEventListener('click', (event) => {
                          submitButton.innerText = submitInitialText;
                          submitButton.removeAttribute('disabled');
                          retryButton.style.display = 'none';
                          submitButton.style.display = 'block';
                          pg_sdk.generate_tokenize(get_tokenize_data(), '#tokenize_example', responseCallback, notCompletedFormCallback);
                        });
                      })();
                    </script>
                  </body>
                  </html>
                ''',
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadStop: (controller, url) {
                // Handle WebView load completion if needed
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
