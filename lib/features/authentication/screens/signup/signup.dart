import 'package:flutter/material.dart';
import 'package:tedix/utils/constants/sizes.dart';
import 'package:tedix/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields),

                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.username,prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: TTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),



                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),



                    const SizedBox(height: TSizes.spaceBtwSections),

                    SizedBox(
                      width: double.infinity,
                      child:ElevatedButton(onPressed:(){},child: const Text(TTexts.createAccount),),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}