import React from "react";
import { makeStyles } from "@material-ui/styles";

const useStyles = makeStyles({
  container: {
    display: "flex",
  },
});

interface Props {
  // 
}

export const ABC = ({}: Props) => {
  const classes = useStyles();

  return (
    <div className={classes.container}>
      CONTENT
    </div>
  );
};

