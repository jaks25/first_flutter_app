import 'package:flutter/material.dart';

class TREE{
  final int ID;
  final String DESCRIPTION;

  TREE(
    {
     this.ID,
     this.DESCRIPTION,
    }
  );
}
//------------------------------------------------------------------------------
class DIAGNOSIS_TREE{
  final int ID;
  final int ID_PARENT;
  final String NAME;
  final int ID_TREE;

  DIAGNOSIS_TREE(
    {
      this.ID,
      this.ID_PARENT,
      this.NAME,
      this.ID_TREE,
    }
  );
}
//------------------------------------------------------------------------------
class DIAGNOSIS_PROCESS{
  final int ID;
  final String STEP_1;
  final String STEP_2;
  final String STEP_3;
  final String STEP_4;
  final String STEP_5;
  final String STEP_6;
  final String STEP_7;
  final String STEP_8;
  final String STEP_9;
  final String STEP_10;
  final String STEP_11;
  final String STEP_12;
  final String STEP_13;
  final String STEP_14;
  final String STEP_15;
  final String STEP_16;
  final String STEP_17;

  DIAGNOSIS_PROCESS(
    {
      this.ID,
      this.STEP_1,
      this.STEP_2,
      this.STEP_3,
      this.STEP_4,
      this.STEP_5,
      this.STEP_6,
      this.STEP_7,
      this.STEP_8,
      this.STEP_9,
      this.STEP_10,
      this.STEP_11,
      this.STEP_12,
      this.STEP_13,
      this.STEP_14,
      this.STEP_15,
      this.STEP_16,
      this.STEP_17,
    }
  );
}
//------------------------------------------------------------------------------
class OWNER{
  final int ID;
  final String LAST_NAME;
  final String FIRST_NAME;
  final String PHONE_NO;

  OWNER(
    {
      this.ID,
      this.LAST_NAME,
      this.FIRST_NAME,
      this.PHONE_NO,
    }
  );
}
//------------------------------------------------------------------------------
class ANIMAL{
  final int ID;
  final int ID_OWNER;
  final String SPECIES;
  final String BREED;
  final String SEX;
  final int AGE;

  ANIMAL(
    {
      this.ID,
      this.ID_OWNER,
      this.SPECIES,
      this.BREED,
      this.SEX,
      this.AGE,
    }
  );
}
//------------------------------------------------------------------------------
class DOCTOR{
  final int ID;
  final String LAST_NAME;
  final String FIRST_NAME;
  final String LICENCE_NO;

  DOCTOR(
    {
      this.ID,
      this.LAST_NAME,
      this.FIRST_NAME,
      this.LICENCE_NO,
    }
  );
}
//------------------------------------------------------------------------------
class DIAGNOSIS{
  final int ID;
  final int ID_DOCTOR;
  final int ID_ANIMAL;
  final int ID_DIAGNOSIS;
  final int ID_DIAGNOSIS_PROCESS;

  DIAGNOSIS(
    {
      this.ID,
      this.ID_DOCTOR,
      this.ID_ANIMAL,
      this.ID_DIAGNOSIS,
      this.ID_DIAGNOSIS_PROCESS,
    }
  );
}